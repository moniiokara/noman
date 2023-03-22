import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maximagri/Model/user_model.dart';
import 'package:maximagri/model/address_model.dart';
import 'package:maximagri/model/district_model.dart';
import 'package:maximagri/model/province_model.dart';
import 'package:maximagri/model/uid_tophead_model.dart';
import 'package:maximagri/widgets/drawer/operations_drawer.dart';

class CreateAccountDesktopPage extends StatefulWidget {
  const CreateAccountDesktopPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountDesktopPage> createState() => _CreateAccountDesktopPageState();
}

class _CreateAccountDesktopPageState extends State<CreateAccountDesktopPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController townController = TextEditingController();

  final _fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    cnicController.dispose();
    districtController.dispose();
    provinceController.dispose();
    cityController.dispose();
    townController.dispose();

    super.dispose();
    nameController.clear();
    phoneController.clear();
    cnicController.clear();
    districtController.clear();
    provinceController.clear();
    cityController.clear();
    townController.clear();
  }

  // create instances of Province, District and Address

  static final List<Province> _provinces = [
    Province(name: 'Balochistan', district: [
      District(
        name: 'Kalat', cities: ['Quetta', 'Turbat', 'Khuzdar', 'Hub'],
      ),
      District(
        name: 'Islamabad', cities: ['Rawalpindi', 'Kahuta', 'Wah', 'Murree'],
      ),
      District(
        name: 'Punjab', cities: ['Burewala', 'Jhang', 'Layyah', 'Bhakkar'],
      ),
    ],),

  ];



  String? _selectedProvince;
  String? _selectedDistrict;
  String? _selectedCity;
  bool status = true;

  @override
  void initState() {
    status = status;
    super.initState();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _createAccount(){

  //   final user = UserModel(
  //     userName: nameController.text,
  //     userPhone: int.parse(phoneController.text.toString()),
  //     userCnic: int.parse(cnicController.text.replaceAll('-', '')),
  //     userType: 'Dealer',
  //
  //     address: Address(
  //       province: _selectedProvince,
  //       district: _selectedDistrict,
  //       city: _selectedCity,
  //       town: townController.text,
  //     ),
  //   );
  //   if(_fromKey.currentState!.validate()){
  //
  //   }
  //
  //
   }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Row(

        children: [
          Expanded(
            flex: 2,
            child: OperationsDrawer(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.74,
                child: Form(
                  key: _fromKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            validator: (value) {
                              // final phoneExp = RegExp(r'^\d{12}$');
                              if (value == null || value.isEmpty) {
                                return 'Phone number is required';
                              }
                              // else if (!phoneExp.hasMatch(value)) {
                              //   return 'Please enter a valid 10 digit phone number';
                              // }
                              return null;
                            },
                            controller: phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Enter Phone Num',
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
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Enter Province',
                            border: OutlineInputBorder(),
                          ),
                          value: _selectedProvince,
                          items: _provinces
                              .map((province) => DropdownMenuItem(
                            value: province.name,
                            child: Text(province.name),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedProvince = value;
                              _selectedDistrict = null;
                              _selectedCity = null;
                            });
                          },
                          validator: (value) =>
                          value ==
                              null ? 'Select the province' : null,
                        ),
                        const SizedBox(height: 16),
                        if (_selectedProvince != null)
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Enter District',
                              border: OutlineInputBorder(),
                            ),
                            value: _selectedDistrict,
                            items: _provinces
                                .firstWhere((province) =>
                            province.name == _selectedProvince)
                                .district
                                .map((district) => DropdownMenuItem(
                              value: district.name,
                              child: Text(district.name),
                            ))
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
                        const SizedBox(height: 16),
                        if (_selectedDistrict != null)
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'Enter City',
                              border: OutlineInputBorder(),
                            ),
                            value: _selectedCity,
                            items: _selectedDistrict != null
                                ? _provinces
                                .firstWhere((province) => province.name == _selectedProvince)
                                .district
                                .firstWhere((district) => district.name == _selectedDistrict)
                                .cities
                                .map((city) => DropdownMenuItem(
                              value: city,
                              child: Text(city),
                            ))
                                .toList()
                                : [],
                            onChanged: (value) {
                              setState(() {
                                _selectedCity = value;
                              });
                            },
                            validator: (value) => value == null ? 'Select the city' : null,
                          ),

                        const SizedBox(
                          height: 16,
                        ),
                        if (_selectedCity != null)
                          SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a valid town name';
                                }
                                return null;
                              },
                              controller: townController,
                              decoration: const InputDecoration(
                                labelText: 'Enter Town Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            //  _saveUser();
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
        ],
      ),
    );
  }
}
