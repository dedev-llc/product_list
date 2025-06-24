


import 'package:product_list/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({required super.title, required super.description, required super.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
