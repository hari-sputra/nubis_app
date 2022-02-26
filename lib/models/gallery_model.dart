// To parse this JSON data, do
//
//     final galleryModel = galleryModelFromJson(jsonString);

import 'dart:convert';

GalleryModel galleryModelFromJson(String str) =>
    GalleryModel.fromJson(json.decode(str));

String galleryModelToJson(GalleryModel data) => json.encode(data.toJson());

class GalleryModel {
  GalleryModel({
    required this.id,
    required this.productsId,
    required this.url,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int productsId;
  String url;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        id: json["id"],
        productsId: json["products_id"],
        url: json["url"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products_id": productsId,
        "url": url,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
