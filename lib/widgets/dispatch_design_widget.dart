import 'package:flutter/material.dart';

class DispatchScreen extends StatefulWidget {
  @override
  _DispatchScreenState createState() => _DispatchScreenState();
}

class _DispatchScreenState extends State<DispatchScreen> {
  TextEditingController _driverNoController = TextEditingController();
  TextEditingController _vehicleNoController = TextEditingController();
  TextEditingController _dispatchTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispatch Input'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _driverNoController,
                decoration:  InputDecoration(
                  labelText: 'Driver Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _vehicleNoController,
                decoration:  InputDecoration(
                  labelText: 'Vehicle Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _dispatchTimeController,
                decoration:  InputDecoration(
                  labelText: 'Dispatch Time',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle dispatch submission here
                  String driverNo = _driverNoController.text;
                  String vehicleNo = _vehicleNoController.text;
                  String dispatchTime = _dispatchTimeController.text;
                  print('Driver No: $driverNo');
                  print('Vehicle No: $vehicleNo');
                  print('Dispatch Time: $dispatchTime');
                },
                child:  Text(
                  'Submit Dispatch',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.green),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
