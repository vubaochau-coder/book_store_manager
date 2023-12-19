part of 'create_product_bloc.dart';

class CreateProductState extends Equatable {
  final String productTitle;
  final String titleErr;
  final String author;
  final String authorErr;
  final BookType type;
  final String publisher;
  final String publisherErr;
  final String publishingYear;
  final String description;
  final String descriptionErr;
  final double price;
  final double discount;
  final List<File> images;

  const CreateProductState({
    this.productTitle = '',
    this.titleErr = '',
    this.author = '',
    this.authorErr = '',
    this.type = BookType.other,
    this.publisher = '',
    this.publisherErr = '',
    this.publishingYear = '2023',
    this.description = '',
    this.descriptionErr = '',
    this.price = 0,
    this.discount = 0,
    this.images = const [],
  });

  @override
  List<Object> get props => [
        productTitle,
        author,
        type,
        publisher,
        publishingYear,
        description,
        price,
        discount,
        images
      ];

  CreateProductState copyWith({
    String? productTitle,
    String? titleErr,
    String? author,
    String? authorErr,
    BookType? type,
    String? publisher,
    String? publisherErr,
    String? publishingYear,
    String? description,
    String? descriptionErr,
    double? price,
    double? discount,
    List<File>? images,
  }) {
    return CreateProductState(
      productTitle: productTitle ?? this.productTitle,
      titleErr: titleErr ?? this.titleErr,
      author: author ?? this.author,
      authorErr: authorErr ?? this.authorErr,
      type: type ?? this.type,
      publisher: publisher ?? this.publisher,
      publisherErr: publisherErr ?? this.publisherErr,
      publishingYear: publishingYear ?? this.publishingYear,
      description: description ?? this.description,
      descriptionErr: descriptionErr ?? this.descriptionErr,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      images: images ?? this.images,
    );
  }
}
