class ProductModel {
  String? id;
  String? title;
  // String? description;
  // double? price;
  // String? image;
  String? authour;
  // String? category;

  ProductModel({
    this.id,
    this.authour,
    // this.category,
    // this.description,
    // this.image,
    // this.price,
    this.title,
  });

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      authour: json['author'],
      // category: json['category'],
      // description: json['description'],
      // image: json['image'],
      // price: json['price'],
      title: json['title'],
    );
  }
}
