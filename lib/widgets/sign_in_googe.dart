import 'package:app_shoe_shop/providers/firebase.utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInGoogle extends StatelessWidget {
  const SignInGoogle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sign In With ",
          style: TextStyle(fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            auth.signInWithGoogle();
          }, //=> Navigator.push(),
          child: Text(
            "Google",
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFFFF7643),
                fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
