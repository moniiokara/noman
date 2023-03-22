// // void addItem() {
// //   if (_selectedItem != null && _totalPrice != null) {
// //     final Map<String, dynamic> item = {
// //       'name': _selectedItem,
// //       'price': _productPrice,
// //       'quantity': _minOrderQuantity,
// //     };
// //     setState(() {
// //       _selectedItems.add(item);
// //       _selectedItem = null;
// //       _minOrderQuantity = null;
// //       _productPrice = null;
// //       _totalPrice = null;
// //     });
// //   }
// // }
//
// import 'package:flutter/material.dart';
//
// class FinalPlaceOrderScreen extends StatefulWidget {
//   const FinalPlaceOrderScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FinalPlaceOrderScreen> createState() => _FinalPlaceOrderScreenState();
// }
//
// class _FinalPlaceOrderScreenState extends State<FinalPlaceOrderScreen> {
//   final List<String> _items = [
//     'Select the Item',
//     'Item A',
//     'Item B',
//
//   ];
//
//   int? _minOrderQuantity;
//
//   // Fetch product price
//
//   String? _selectedItem;
//   int? _productPrice;
//   int _totalPrice = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           DropdownButtonFormField(
//             decoration: const InputDecoration(border: OutlineInputBorder()),
//             value: _selectedItem,
//             items: _items
//                 .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                 .toList(),
//             onChanged: (value) {
//               setState(() {
//                 _selectedItem = value;
//                 fetchMinOrderQuantity(_selectedItem!);
//               });
//             },
//           ),
//           const SizedBox(height: 16.0),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                       'Product Price:\$${_productPrice?.toStringAsFixed(2) ?? ''}'),
//                   Text('MOQ: $_minOrderQuantity'),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 16.0),
//           TextFormField(
//             enabled: false,
//             decoration: InputDecoration(
//                 hintText: 'Total Price: $_totalPrice',
//                 border: const OutlineInputBorder()),
//           ),
//           const SizedBox(height: 16.0),
//           Container(
//             height: 30,
//             width: 120,
//             decoration: const BoxDecoration(color: Colors.lightGreen),
//             child: InkWell(
//               onTap: () {},
//               child: const Center(
//                   child: Text(
//                 "More Add Items",
//                 style: TextStyle(color: Colors.white),
//               )),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
