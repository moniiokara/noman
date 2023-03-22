import 'package:flutter/material.dart';

class AddItemScreenTwo extends StatefulWidget {
  @override
  _AddItemScreenTwoState createState() => _AddItemScreenTwoState();
}

class _AddItemScreenTwoState extends State<AddItemScreenTwo> {
  final List<String> _sizes = [
    'Item A',
    'Item B',
    'Item C',
    'Item D',
    'Item E'
  ];
  final List<Widget> _itemForms = [];
  int _stopCount = 0;
  final int _stopLimit = 4;
  final double Price = 20;

  @override
  void initState() {
    super.initState();

    _addItemForm();
  }

  _addItemForm() {
    if (_stopCount < _stopLimit) {
      _stopCount++;
      _itemForms.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Item Name',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              validator: (value) =>
                  value == null ? 'Select the district' : null,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: null,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
              onChanged: (String? newValue) {},
              items: _sizes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Text(
              'Price: $Price',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0,),
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                hintText: 'Enter minimum order quantity',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number, // set the keyboard type to number
              validator: (value) =>
              value!.isEmpty ? 'Please enter a minimum order quantity' : null,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Stop Name',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                hintText: 'Enter stop name',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a stop name' : null,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Shop Name',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                hintText: 'Enter shop name',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a shop name' : null,
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      );

      setState(() {});
    }
  }

  // void _removeItemForm() {
  //   // Remove the last item form widget from the list
  //   if (_itemForms.isNotEmpty) {
  //     _itemForms.removeLast();
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._itemForms,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      _addItemForm();
                    },
                    child: Container(
                      height: 60,
                      width: 150,
                      color: Colors.green,
                      child: const Center(
                        child: Text("Add More Stop"),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 150,
                      color: Colors.red,
                      child: const Center(
                        child: Text("Payment Processed"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
