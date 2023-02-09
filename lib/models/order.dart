class OrderModel {
  int id;
  String email;
  String phone;
  String address;
  Cart cart;
  String remark;
  OrderModel({this.id, this.email, this.phone, this.address, this.cart, this.remark});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['remark'] = this.remark;
    if (this.cart != null) {
      data['cart'] = this.cart.toJson();
    }
    return data;
  }
}

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
  int category;
  int packSize;

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
        this.packSize});

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
    category = json['category'];
    packSize = json['pack_size'];
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
    data['category'] = this.category;
    data['pack_size'] = this.packSize;
    return data;
  }
}

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


class Cartproducts {
  int id;
  double price;
  int quantity;
  double subtotal;
  Cart cart;
  List<Product> product;

  Cartproducts(
      {this.id,
        this.price,
        this.quantity,
        this.subtotal,
        this.cart,
        this.product});

  Cartproducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    subtotal = json['subtotal'];
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    if (json['product'] != null) {
      product = new List<Product>();
      json['product'].forEach((v) {
        product.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['subtotal'] = this.subtotal;
    if (this.cart != null) {
      data['cart'] = this.cart.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  int id;
  double total;
  bool isComplete;
  String date;
  int user;
  List<Cartproducts> cartproducts;

  Cart({this.id, this.total, this.isComplete, this.date, this.user, this.cartproducts});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    isComplete = json['isComplete'];
    date = json['date'];
    user = json['user'];
    if (json['cartproducts'] != null) {
      cartproducts = new List<Cartproducts>();
      json['cartproducts'].forEach((v) {
        cartproducts.add(new Cartproducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['isComplete'] = this.isComplete;
    data['date'] = this.date;
    data['user'] = this.user;
    if (this.cartproducts != null) {
      data['cartproducts'] = this.cartproducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}