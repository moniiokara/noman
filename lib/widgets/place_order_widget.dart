import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  List<String> _sizes = ['Item A', 'Item B', 'Item C', 'Item D'];
  List<String> _stopNames = [];
  List<String> _shopNames = [];
  TextEditingController _stopNameController = TextEditingController();
  TextEditingController _shopNameController = TextEditingController();

  void _addStop() {
    setState(() {
      _stopNames.add(_stopNameController.text);
      _shopNames.add(_shopNameController.text);
      _stopNameController.clear();
      _shopNameController.clear();
    });
  }

  String? selectedItems;

  Widget _buildStopField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        const Text(
          'Stop Name',
          style: TextStyle(fontSize: 16.0),
        ),
        TextField(
          controller: _stopNameController,
          decoration: const InputDecoration(
            hintText: 'Enter stop name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'Shop Name',
          style: TextStyle(fontSize: 16.0),
        ),
        TextField(
          controller: _shopNameController,
          decoration: const InputDecoration(
            hintText: 'Enter shop name',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildItemField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        const Text(
          'Item Name',
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 16.0),
        DropdownButtonFormField<String>(
          validator: (value) => value == null ? 'Select an item' : null,
          decoration: const InputDecoration(border: OutlineInputBorder()),
          value: selectedItems,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedItems = newValue!;
            });
          },
          items: _sizes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 16.0),
        const SizedBox(height: 16.0),
        const Text(
          'Stop Name',
          style: TextStyle(fontSize: 16.0),
        ),
        TextField(
          controller: _stopNameController,
          decoration: const InputDecoration(
            hintText: 'Enter stop name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'Shop Name',
          style: TextStyle(fontSize: 16.0),
        ),
        TextField(
          controller: _shopNameController,
          decoration: const InputDecoration(
            hintText: 'Enter shop name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

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
              _buildItemField(),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _stopNames.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16.0),
                        Text(
                          'Stop ${index + 1}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Stop Name:${_stopNames[index]}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Shop Name: ${_shopNames[index]}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    );
                  }),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: _addStop,
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
                        child: Text("Add Payment"),
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
