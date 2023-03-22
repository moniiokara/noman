import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/TestFolder/login_screen.dart';
import 'package:maximagri/model/address_model.dart';
import 'package:maximagri/model/district_model.dart';
import 'package:maximagri/model/province_model.dart';
import 'package:maximagri/model/uid_tophead_model.dart';
import 'package:maximagri/model/user_model.dart';

class SendData extends StatefulWidget {
  const SendData({Key? key}) : super(key: key);

  @override
  State<SendData> createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController townController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _fromKey = GlobalKey<FormState>();

  static final List<Province> _provinces = [
    Province(name: 'America', district: [
      District(
        name: 'Kalat',
        cities: ['Quetta', 'Turbat', 'Khuzdar', 'Hub'],
      ),
      District(
        name: 'Lahore',
        cities: ['Gojra', 'Hyderabad', 'Jhang', 'Kandhkot'],
      ),
      District(
        name: 'Swat',
        cities: ['Quetta', 'Rawalpini', 'Peshawar', 'Swabi'],
      ),
    ]),
    Province(name: 'Pakistan', district: [
      District(
          name: 'Punjab', cities: ['mulatn', 'okara', 'peshaw', 'faislabae']),
      District(
          name: 'Multan', cities: ['Peshawar', 'Khuzdar', 'Kandhkot', 'Gojra']),
    ]),
  ];

  String? _selectedProvinces;
  String? _selectedDistrict;
  String? _selectedCity;

  void _createAccount() async {
    if (_fromKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        if (_auth.currentUser != null) {
          final user = UserModel(
              userName: nameController.text,
              userPhone: int.parse(phoneController.text.toString()),
              userCnic: int.parse(cnicController.text.replaceAll('-', '')),
              userType: 'Dealer',
              userUid: _auth.currentUser!.uid,
              userStatus: true,
              uidTopHead:
                  UidTopHead("oprUid", "zsmUid", "asmUid", "asoUid", "drlUid"),
              address: Address(
                province: _selectedProvinces!,
                district: _selectedDistrict!,
                city: _selectedCity!,
              ));
          _firestore
              .collection("Profile")
              .doc()
              .set(user.toJson())
              .then((value) => print("Successfully data Add"))
              .then((value) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => LoginScreen()));
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.84,
            child: Form(
              key: _fromKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Enter the name
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        maxLines: 1,
                        validator: (value) {
                          final nameExp = RegExp(r'^[A-Za-z ]+$');
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          } else if (!nameExp.hasMatch(value)) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Enter the email
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Enter the password
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Number is required';
                          }
                          return null;
                        },
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Phone',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Enter the cnic
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        validator: (value) {
                          final cnicExp = RegExp(r'^\d{5}-\d{7}-\d{1}$');
                          if (value == null || value.isEmpty) {
                            return 'CNIC number is required';
                          } else if (!cnicExp.hasMatch(value)) {
                            return 'Please enter a valid CNIC number';
                          }
                          return null;
                        },
                        controller: cnicController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Cnic Num',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                          labelText: 'Enter the Province',
                          border: OutlineInputBorder()),
                      value: _selectedProvinces,
                      items: _provinces
                          .map((province) => DropdownMenuItem(
                              value: province.name, child: Text(province.name)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedProvinces = value;
                          _selectedDistrict = null;
                          _selectedCity = null;
                        });
                      },
                      validator: (value) =>
                          value == null ? 'Select the province' : null,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (_selectedProvinces != null)
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                            labelText: 'Enter the District',
                            border: OutlineInputBorder()),
                        value: _selectedDistrict,
                        items: _provinces
                            .firstWhere((province) =>
                                province.name == _selectedProvinces)
                            .district
                            .map((districts) => DropdownMenuItem(
                                value: districts.name,
                                child: Text(districts.name)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedDistrict = value;
                            _selectedCity = null;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Select the district' : null,
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (_selectedDistrict != null)
                      DropdownButtonFormField(
                          decoration: const InputDecoration(
                            labelText: 'Enter City',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                              value == null ? 'Select the city' : null,
                          value: _selectedCity,
                          items: _provinces
                              .firstWhere((province) =>
                                  province.name == _selectedProvinces)
                              .district
                              .firstWhere((district) =>
                                  district.name == _selectedDistrict)
                              .cities
                              .map((city) => DropdownMenuItem(
                                  value: city, child: Text(city)))
                              .toList(),
                          onChanged: (value) {
                            _selectedCity = value;
                          }),

                    const SizedBox(
                      height: 20,
                    ),

                    // Create Account Button
                    InkWell(
                      onTap: () {
                        _createAccount();
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? "),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
