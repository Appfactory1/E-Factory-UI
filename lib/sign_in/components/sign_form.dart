import 'package:app_shoe_shop/providers/firebase.utils.dart';
import 'package:flutter/material.dart';
import '../../otp/otp_screen.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_surfix_icon.dart';
import '../../widgets//form_error.dart';

import '../../widgets/default_button.dart';
import '../../constants/constants.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String number;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 26),
          // buildPasswordFormField(),
          // SizedBox(height: 26),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: remember,
          //       activeColor: kPrimaryColor,
          //       onChanged: (value) {
          //         setState(() {
          //           remember = value;
          //         });
          //       },
          //     ),
          //     Text("Remember me"),
          //     Spacer(),
          //     GestureDetector(
          //       onTap: () => Navigator.pushNamed(
          //           context, ForgotPasswordScreen.routeName),
          //       child: Text(
          //         "Forgot Password",
          //         style: TextStyle(decoration: TextDecoration.underline),
          //       ),
          //     )
          //   ],
          // ),
          FormError(errors: errors),
          SizedBox(height: 17),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print('1');
                auth.verifyPhone(context, number);
                // if all are valid then go to success screen
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => OtpScreen()),
                // );
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => number = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (value.length == 13) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (value.length !=
            13 /*!emailValidatorRegExp.hasMatch(value)*/) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Call.svg",
        ),
      ),
    );
  }
}
