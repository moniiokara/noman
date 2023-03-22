
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String productName;
  String productDescrption;
  int productWeight;
  int productPrice;
  int moqProduct;
  int skuProduct;
  List<Category> categories;

  ProductModel(
      {required this.productName,
      required this.productDescrption,
      required this.productWeight,
      required this.productPrice,
      required this.moqProduct,
      required this.skuProduct,
      required this.categories});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);


}

@JsonSerializable()
class Category {
  int categoryId;
  String categoryName;

  Category({required this.categoryId, required this.categoryName});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
