import 'dart:async';
import 'package:app_shoe_shop/pages/home.dart';

import './../otp/otp_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../helper/user.dart';
import '../models.fs/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  // Firestore _firestore = Firestore.instance;
  UserServices _userServicse = UserServices();
  UserModel _userModel;
  TextEditingController phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  bool logedIn = false;
  bool loading = false;

//  getter
  UserModel get userModel => _userModel;
  Status get status => _status;
  FirebaseUser get user => _user;

  AuthProvider.initialize() {
    readPrefs();
  }

  Future signOut() async {
    auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> readPrefs() async {
    _status = Status.Unauthenticated;

    await Future.delayed(Duration(seconds: 3)).then((v) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      logedIn = prefs.getBool('logedIn') ?? false;

      if (logedIn) {
        _user = await auth.currentUser();
        //_userModel = await _userServicse.getUserById(_user.uid);
        _status = Status.Authenticated;
        notifyListeners();
        return;
      }

      _status = Status.Unauthenticated;
      notifyListeners();
    });
  }

  Future<AuthResult> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

// ! PHONE AUTH
  Future<void> verifyPhone(BuildContext context, String number) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpScreen()));
    };
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: number.trim(), // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential.toString() + "lets make this work");
          },
          verificationFailed: (AuthException exceptio) {
            print('${exceptio.message} + something is wrong');
          });
    } catch (e) {
      handleError(e, context);
      errorMessage = e.toString();
      notifyListeners();
    }
    notifyListeners();
  }

  Future<bool> smsOTPDialog(BuildContext context, value) async {
    // return showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('Enter SMS Code'),
    //         content: Container(
    //           height: 85,
    //           child: Column(children: [
    //             TextField(
    //               onChanged: (value) {
    //                 this.smsOTP = value;
    //               },
    //             ),
    //             // (errorMessage != ''
    //             //     ? Text(
    //             //         errorMessage,
    //             //         style: TextStyle(color: Colors.red),
    //             //       )
    //             //     : Container())
    //           ]),
    //         ),
    //         contentPadding: EdgeInsets.all(10),
    //         actions: <Widget>[
    //           FlatButton(
    //             child: Text('Done'),
    //             onPressed: () async {
    loading = true;
    print("entered");
    this.smsOTP = value;
    notifyListeners();
    auth.currentUser().then((user) async {
      if (user != null) {
        _userModel = await _userServicse.getUserById(user.uid);
        if (_userModel == null) {
          //_createUser(id: user.uid, number: user.phoneNumber);
          //create user
        }
        Navigator.of(context).pop();
        loading = false;
        notifyListeners();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        loading = false;
        notifyListeners();
        Navigator.of(context).pop();
        signIn(context);
      }
    });
  }
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  signIn(BuildContext context) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final AuthResult user = await auth.signInWithCredential(credential);
      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.user.uid == currentUser.uid);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("logedIn", true);
      logedIn = true;
      print("signedIn");
      if (user != null) {
        _userModel = await _userServicse.getUserById(user.user.uid);
        if (_userModel == null) {
          _createUser(id: user.user.uid, number: user.user.phoneNumber);
        }

        loading = false;
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
      loading = false;

      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
      notifyListeners();
    } catch (e) {
      handleError(e, context);
    }
  }

  handleError(error, BuildContext context) {
    print(error);
    errorMessage = error.toString();
    notifyListeners();
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        // FocusScope.of(context).requestFocus(new FocusNode());
        // errorMessage = 'Invalid Code';
        // Navigator.of(context).pop();
        // smsOTPDialog(context).then((value) {
        //   print('sign in');
        // });
        break;
      default:
        errorMessage = error.message;
        break;
    }
    notifyListeners();
  }

  void _createUser({String id, String number}) {
    _userServicse.createUser({
      "id": id,
      "number": number,
    });
  }

  // void updateUser(Map<String, dynamic> values) {
  //   _userServicse.updateUserData(values);
  // }
}
