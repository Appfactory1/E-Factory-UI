// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';

// class Experiment extends StatefulWidget {
//   @override
//   _ExperimentState createState() => _ExperimentState();
// }

// class _ExperimentState extends State<Experiment> {
//   static final Firestore _db = Firestore.instance;
//   String add = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           TextField(
//             onChanged: (val) {
//               setState(() {
//                 add = val;
//               });
//             },
//           ),
//           RaisedButton(
//             child: Text('submit'),
//             onPressed: add == ''
//                 ? () {
//                     print('fuck');
//                     print(add);
//                   }
//                 : () async {
//                     if (add != "")
//                       await _db.collection('exp').add({'name': add});
//                     print('something');
//                   },
//           ),
//           StreamBuilder(
//               stream: _db.collection('exp').orderBy('name').snapshots(),
//               builder: (BuildContext context, snapshot) {
//                 // return FlatButton(
//                 //     onPressed: () {
//                 //       print(snapshot.data.documents[0]['name']);
//                 //     },
//                 //     child: Text('bubu'));
//                 return Expanded(
//                   child: ListView.builder(
//                     physics: AlwaysScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: snapshot.data.documents.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Text(snapshot.data.documents[index]['name']);
//                     },
//                   ),
//                 );
//               })
//         ],
//       ),
//     );
//   }
// }
