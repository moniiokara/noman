
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/TestFolder/PlaceOrder/product_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static List<Category> categories = [
    Category(categoryId: 1, categoryName: 'Category 1'),
    Category(categoryId: 2, categoryName: 'Category 2'),
    Category(categoryId: 3, categoryName: 'Category 3'),
    Category(categoryId: 4, categoryName: 'Category 4'),
    Category(categoryId: 5, categoryName: 'Category 5'),
  ];

  ProductModel product = ProductModel(
    productName: 'Product 1',
    productWeight: 50,
    productPrice: 100,
    moqProduct: 5,
    skuProduct: 12345,

    productDescrption: 'Product Descrption', categories: categories,
  );

  Category? selectedCategory;

 void productData() async{

   // _firestore.collection("Product").doc().set(product)

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Product Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [

            DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                value: selectedCategory,
              items: product.categories.map((Category category) {
                return DropdownMenuItem<Category>(
                  value: category,
                  child: Text(category.categoryName),
                );
              }).toList(),
              onChanged: (Category? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },),





          ],
        ),
      ),
    );

  }
}
