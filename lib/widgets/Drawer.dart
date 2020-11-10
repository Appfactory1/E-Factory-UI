import 'package:app_shoe_shop/pages/History.dart';
import 'package:app_shoe_shop/pages/home.dart';
import 'package:app_shoe_shop/pages/home_page.dart';
import 'package:app_shoe_shop/pages/worker/home.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            shrinkWrap: true,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => History()));
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8),
                  child: Text("Become a worker"),
                ),
                color: Colors.yellow[300],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WorkerHome()));
                }),
          ),
        ],
      ),
    );
  }
}
