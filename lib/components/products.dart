import 'package:flutter/material.dart';

import 'package:app/pages/product_detail.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "product-1",
      "image": "images/products/carrot.jpeg",
      "price": 14.0
    },
    {
      "name": "product-2",
      "image": "images/products/cabbage.jpg",
      "price": 14.0
    },
    {
      "name": "product-3",
      "image": "images/products/cucumber.jpg",
      "price": 14.0
    },
    {
      "name": "product-4",
      "image": "images/products/eggplant.jpg",
      "price": 14.0
    },
    {"name": "product-5", "image": "images/products/tomato.jpg", "price": 14.0}
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleProduct(
              product_name: product_list[index]['name'],
              product_image: product_list[index]['image'],
              product_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final product_name;
  final product_image;
  final product_price;

  SingleProduct({this.product_name, this.product_image, this.product_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new ProductDetails(
                  product_detail_name: product_name,
                  product_detail_image: product_image,
                  product_detail_price: product_price,
                  product_detail_content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                ))),
            child: GridTile(
              footer: Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 8.0),
                child: Container(
                  color: Colors.white70,
                  child: new Row(children: <Widget>[
                    Expanded(
                        child: Text(product_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),)
                    ),
                    new Text("\$${product_price}", style: TextStyle(color: Colors.red),)
                  ],),
                  // child: ListTile(
                  //   leading: Text(
                  //     product_name,
                  //     style: TextStyle(fontWeight: FontWeight.bold),
                  //   ),
                  //   title: Text(
                  //     "\$$product_price",
                  //     style: TextStyle(
                  //         color: Colors.red, fontWeight: FontWeight.w700),
                  //   ),
                  //   subtitle: Text(
                  //     "DISC PRICE",
                  //     style: TextStyle(
                  //         color: Colors.black54,
                  //         fontWeight: FontWeight.w800,
                  //         decoration: TextDecoration.lineThrough),
                  //   ),
                  // ),
                ),
              ),
              child: Image.asset(
                product_image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
