import 'package:book_store_manager/utils/converter.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final String author;
  final String type;
  final String publisher;
  final String publishingYear;
  final String searchKey;

  final double price;
  final double discount;
  final List<String> images;
  final int stock;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.type,
    required this.publisher,
    required this.publishingYear,
    required this.price,
    required this.discount,
    required this.images,
    required this.searchKey,
    required this.stock,
  });

  factory ProductModel.fromJson(String id, Map<String, dynamic> json) {
    List<String> img = List.from(json['listURL']);

    return ProductModel(
      id: id,
      title: cvToString(json['title']),
      description: cvToString(json['description']),
      author: cvToString(json['author']),
      type: cvToString(json['type']),
      publisher: cvToString(json['publisher']),
      publishingYear: cvToString(json['publisingYear']),
      price: cvToDouble(json['price']),
      discount: cvToDouble(json['discount']),
      images: img,
      searchKey: cvToString(json['searchKey']),
      stock: cvToInt(json['stock']),
    );
  }
}
