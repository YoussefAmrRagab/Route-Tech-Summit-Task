class Product {
  int id;
  String title;
  String description;
  double priceBeforeDiscount;
  double discountPercentage;
  double rating;
  String thumbnail;
  late double priceAfterDiscount =
      priceBeforeDiscount - (priceBeforeDiscount * discountPercentage / 100);

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.priceBeforeDiscount,
    required this.discountPercentage,
    required this.rating,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        priceBeforeDiscount: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        thumbnail: json["thumbnail"],
      );
}
