class Product {
  int id;
  String name;
  double price;
  double discPrice;
  String description;
  int invStock;
  bool status;
  String thumbImage;
  String createdAt;
  Category category;
  PackSize packSize;
  bool favourite;
  List<String> zonelist;

  Product(
      {this.id,
        this.name,
        this.price,
        this.discPrice,
        this.description,
        this.invStock,
        this.status,
        this.thumbImage,
        this.createdAt,
        this.category,
        this.packSize,
        this.favourite,
        this.zonelist});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discPrice = json['disc_price'];
    description = json['description'];
    invStock = json['inv_stock'];
    status = json['status'];
    thumbImage = json['thumb_image'];
    createdAt = json['created_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    packSize = json['pack_size'] != null
        ? new PackSize.fromJson(json['pack_size'])
        : null;
    favourite = json['favourite'];
    zonelist = json['zonelist'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['disc_price'] = this.discPrice;
    data['description'] = this.description;
    data['inv_stock'] = this.invStock;
    data['status'] = this.status;
    data['thumb_image'] = this.thumbImage;
    data['created_at'] = this.createdAt;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.packSize != null) {
      data['pack_size'] = this.packSize.toJson();
    }
    data['favourite'] = this.favourite;
    data['zonelist'] = this.zonelist;
    return data;
  }
}

// class Category {
//   int id;
//   String title;
//
//   Category({this.id, this.title});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     return data;
//   }
// }

class Category {
  int id;
  String title;
  String thumbImage;

  Category({this.id, this.title, this.thumbImage});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbImage = json['thumb_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumb_image'] = this.thumbImage;
    return data;
  }
}

// class PackSize {
//   int id;
//   String size;
//
//   PackSize({this.id, this.size});
//
//   PackSize.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     size = json['size'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['size'] = this.size;
//     return data;
//   }
// }

class PackSize {
  int id;
  String size;
  double qty;
  String measure;

  PackSize({this.id, this.size, this.qty, this.measure});

  PackSize.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
    qty = json['qty'];
    measure = json['measure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size'] = this.size;
    data['qty'] = this.qty;
    data['measure'] = this.measure;
    return data;
  }
}
