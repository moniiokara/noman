// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productName: json['productName'] as String,
      productDescrption: json['productDescrption'] as String,
      productWeight: json['productWeight'] as int,
      productPrice: json['productPrice'] as int,
      moqProduct: json['moqProduct'] as int,
      skuProduct: json['skuProduct'] as int,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productDescrption': instance.productDescrption,
      'productWeight': instance.productWeight,
      'productPrice': instance.productPrice,
      'moqProduct': instance.moqProduct,
      'skuProduct': instance.skuProduct,
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      categoryId: json['categoryId'] as int,
      categoryName: json['categoryName'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
    };
