class ProductModel {
  final String id;
  final String title;
  final String description;
  final String author;
  final String type;
  final String publisher;
  final String publishingYear;

  final double price;
  final double discount;
  final List<String> images;

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
  });
}
