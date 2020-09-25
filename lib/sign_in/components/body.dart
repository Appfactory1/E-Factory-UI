import 'package:app_shoe_shop/providers/firebase.utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/sign_in_googe.dart';
import '../../widgets/socal_card.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  static MediaQueryData _mediaQueryData;
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.08),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Authenticate with your phone number  \nor continue with Google",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  SignForm(),
                  SizedBox(height: screenHeight * 0.15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {
                          auth.signInWithGoogle();
                        },
                        white: true,
                      ),
                      // SocalCard(
                      //   icon: "assets/icons/facebook-2.svg",
                      //   press: () {},
                      //   white: true,
                      // ),
                      // SocalCard(
                      //   icon: "assets/icons/twitter.svg",
                      //   press: () {},
                      //   white: true,
                      // ),
                    ],
                  ),
                  SizedBox(height: 17),
                  SignInGoogle(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
