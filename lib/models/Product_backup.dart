class Product {
  final String name;
  final String image;
  final double price;
  final String description;

  Product(this.name, this.image, this.price, this.description);

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
        json['name'],
        json['thumb_image'],
        json['price'],
        json['description']
    );
  }
}