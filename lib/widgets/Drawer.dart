<<<<<<< HEAD
=======
import 'package:app_shoe_shop/pages/History.dart';
import 'package:app_shoe_shop/pages/home.dart';
import 'package:app_shoe_shop/pages/home_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Username"),
              accountEmail: Text("email@gmail.com")),
          ListTile(
            title: Text("Home"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          Divider(
            color: Colors.black,
            height: 4.0,
          ),
          ListTile(
            title: Text("Services"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          Divider(
            color: Colors.black,
            height: 4.0,
          ),
          ListTile(
            title: Text("History"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => History()));
            },
          ),
        ],
      ),
    );
  }
}
>>>>>>> parent of b69ff03... almost UI
