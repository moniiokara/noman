// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:maximagri/model/address_model.dart';
// import 'package:maximagri/model/district_model.dart';
// import 'package:maximagri/model/uid_tophead_model.dart';
// import 'package:maximagri/model/user_model.dart';
//
// class AsoCreate extends StatefulWidget {
//   const AsoCreate({Key? key}) : super(key: key);
//
//   @override
//   State<AsoCreate> createState() => _AsoCreateState();
// }
//
// class _AsoCreateState extends State<AsoCreate> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   void sentData() {
//     final currentUser = _auth.currentUser;
//     final userUid = currentUser?.uid;
//
//     final user = UserModel(
//       userName: "Sent Data 2",
//       userType: "Dealer 2",
//       userUid: userUid,
//       userStatus: true,
//       userCnic: 35302 - 1903938 - 1,
//       userPhone: 03419840585,
//       address: Address(province: 'Punjab', district: 'District', city: 'City'),
//       uidTopHead: UidTopHead("oprUid", "zsmUid", "asmUid", "asoUid", "drlUid"),
//     );
//     print(user);
//     _auth
//         .createUserWithEmailAndPassword(
//             email: "user4@gmail.com", password: "123456")
//         .then((value) async {
//       await _firestore
//           .collection("userProfile")
//           .doc()
//           .set(user.toJson())
//           .then((value) => print("Success fully Sent"));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sent Data"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             sentData();
//           },
//           child: Text("Sent Data"),
//         ),
//       ),
//     );
//   }
// }
