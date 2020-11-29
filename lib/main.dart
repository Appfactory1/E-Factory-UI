import 'package:app_shoe_shop/pages/dummy_form_user.dart';
import 'package:app_shoe_shop/pages/experiment.dart';
import 'package:app_shoe_shop/pages/get_started.dart';
import 'package:app_shoe_shop/pages/home.dart';
import 'package:app_shoe_shop/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.black,
              ),
        ),
      ),
      home: UserDetail(),
    );
  }
}
