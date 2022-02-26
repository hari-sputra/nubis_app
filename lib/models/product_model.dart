// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

import 'package:nubis_app/models/category_model.dart';
import 'package:nubis_app/models/gallery_model.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
  required  this.id,
  required  this.name,
  required  this.price,
  required  this.description,
  required  this.tags,
  required  this.categoriesId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  required  this.category,
  required  this.galleries,
  });

  int id;
  String name;
  int price;
  String description;
  String tags;
  int categoriesId;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryModel category;
  List<GalleryModel> galleries;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        tags: json["tags"],
        categoriesId: json["categories_id"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        category: CategoryModel.fromJson(json['category']),
        galleries: json['galleries']
            .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "tags": tags,
        "categories_id": categoriesId,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "category": category.toJson(),
        'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      };
}
