import 'package:flutter/material.dart';

class FinalPlaceOrderScreen extends StatefulWidget {
  const FinalPlaceOrderScreen({Key? key}) : super(key: key);

  @override
  State<FinalPlaceOrderScreen> createState() => _FinalPlaceOrderScreenState();
}

class _FinalPlaceOrderScreenState extends State<FinalPlaceOrderScreen> {
  TextEditingController stopController = TextEditingController();
  TextEditingController shopController = TextEditingController();

  final List<String> _items = [
    'Select the Item',
    'Item A',
    'Item B',
    'Item C',
    'Item D',
    'Item E'
  ];

  int? _minOrderQuantity;
  final Map<String, int> _productQuantities = {
    'Item A': 5,
    'Item B': 10,
    'Item C': 3,
    'Item D': 7,
    'Item E': 2,
  };

  // Fetch product price

  final Map<String, int> _productPrices = {
    'Item A': 10,
    'Item B': 20,
    'Item C': 5,
    'Item D': 15,
    'Item E': 45,
  };

  String? _selectedItem;
  int? _productPrice;
  int _totalPrice = 0;

  void fetchMinOrderQuantity(String selectedItem) {
    _selectedItem = selectedItem;
    _minOrderQuantity = _productQuantities[_selectedItem!];
    _productPrice = _productPrices[_selectedItem!];

    if (_minOrderQuantity != null && _productPrice != null) {
      num totalPrice = _minOrderQuantity! * _productPrice!;
      setState(() {
        _totalPrice = totalPrice.toInt();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMinOrderQuantity(_productQuantities.toString());
    _selectedItem = _items.first;
  }

  List<Map<String, dynamic>> _selectedItems = [];

  void _addItem() {
    if (_selectedItem != null && _productPrice != null && _productQuantities != null) {
      final Map<String, dynamic> item = {
        'name': _selectedItem,
        'price': _productPrice,
        'quantity': _productQuantities,
      };
     setState(() {
       _selectedItems.add(item);
     });
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Maxim Place Order"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Add Stop"),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: stopController,
              decoration: const InputDecoration(
                  hintText: 'Enter the Stop Name',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: shopController,
              decoration: const InputDecoration(
                  hintText: 'Enter the Shop Name',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text("Add Items"),
            const SizedBox(
              height: 16.0,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: _selectedItem,
              items: _items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                  fetchMinOrderQuantity(_selectedItem!);
                });
              },
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'Product Price:\$${_productPrice?.toStringAsFixed(2) ?? ''}'),
                    Text('MOQ: $_minOrderQuantity'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                  hintText: 'Total Price: $_totalPrice',
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 30,
              width: 120,
              decoration: const BoxDecoration(color: Colors.lightGreen),
              child: InkWell(
                onTap: () {
                   _addItem();
                },
                child: const Center(
                    child: Text(
                  "More Add Items",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
