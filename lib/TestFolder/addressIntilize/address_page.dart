import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/TestFolder/addressIntilize/city_model.dart';
import 'package:maximagri/TestFolder/addressIntilize/districtinlize_model.dart';
import 'package:maximagri/TestFolder/addressIntilize/provinceinlize_model.dart';
import 'package:maximagri/TestFolder/addressIntilize/user_address.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AddressInitializeModel address = AddressInitializeModel(provinces: [
    ProvinceModel(name: 'Khyber Pakhtunkhwa', districts: [
      DistrictModel(districtName: 'Abbottabad', cities: [
        'Havelian',
        'Attock',
        'Fateh Jang',
      ]),
    ]),
    ProvinceModel(name: 'Punjab', districts: [
      DistrictModel(districtName: 'Attock', cities: [
        'Hassan Abdal',
         'Hazro',
         'Jand',
      ]),
    ]),
  ]);

  void addresss() {
    _firestore
        .collection("Address")
        .doc()
        .set(address.toJson())
        .then((value) => print("Successfully Added Data"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address Data"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  addresss();
                },
                child: Text("Address")),
          ],
        ),
      ),
    );
  }
}
