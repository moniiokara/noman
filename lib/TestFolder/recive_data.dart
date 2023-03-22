import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/model/user_model.dart';

class ReciveData extends StatefulWidget {
  const ReciveData({Key? key}) : super(key: key);

  @override
  State<ReciveData> createState() => _ReciveDataState();
}

class _ReciveDataState extends State<ReciveData> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recive Data"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(
                  stream: _firestore
                      .collection("Profile")
                      .where("userUid", isEqualTo: _auth.currentUser?.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.active) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      print(snapshot.hasData);
                      final json = snapshot.data!.docs[0].data();
                      UserModel userdata = UserModel.fromJson(json);
                      print(userdata);
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //  Text("Noman")
                            Text('User Name :${userdata.userName}'),
                            Text('User Type :${userdata.userType}'),
                            // Text(userdata.userType),
                            // Text(userdata.address.province),
                            // Text(userdata.address.district),
                            // Text(userdata.address.city),
                            const SizedBox(
                              height: 23.0,
                            ),


                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                      width: 1.0,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  hintText:
                                  'Province:  ${userdata.address.province}'),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                      width: 1.0,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  hintText:
                                      'District:  ${userdata.address.district}'),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                      width: 1.0,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  hintText:
                                  'Province:  ${userdata.address.city}'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: Text("No data found"));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
