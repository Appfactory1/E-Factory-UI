import 'package:app_shoe_shop/constants/constants.dart';
import 'package:app_shoe_shop/firebase/firestore.dart';
import 'package:app_shoe_shop/models/job.dart';
import 'package:app_shoe_shop/models/user.dart';
import 'package:app_shoe_shop/models/worker.dart';
import 'package:app_shoe_shop/pages/work_detail.dart';
import 'package:flutter/material.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';

class WorkerForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: UserForm(),
      ),
    );
  }
}

// Create a Form widget.
class UserForm extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  UserForm({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  UserFormState createState() {
    return UserFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class UserFormState extends State<UserForm> {
  String address;
  String detail;
  String desc;
  String uname;
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(
        physics: BouncingScrollPhysics(),
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                enabledBorder: outlineInputBorder(),
                labelText: "Username",
                hintText: "Enter username",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.home_filled),
              ),
              onChanged: (val) => uname = val,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: outlineInputBorder(),
                focusedBorder: outlineInputBorder(),
                enabledBorder: outlineInputBorder(),
                labelText: "Address",
                hintText: "Enter Address",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(Icons.home_filled),
              ),
              onChanged: (val) => address = val,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Container(
              height: 170,
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                maxLines: 15,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: outlineInputBorder(),
                  focusedBorder: outlineInputBorder(),
                  enabledBorder: outlineInputBorder(),
                  labelText: "Description",
                  hintText: "Enter info about the problem...",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (val) => detail = val,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8, top: 16),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.blue,
              onPressed: () async {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  Worker j =
                      Worker(name: uname, address: address, phone: detail);
                  Api("worker").addDocument(j.toJson());
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WorkForm()));
              },
              child: Text(
                "Submit",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
