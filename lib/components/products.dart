import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


import 'package:app/pages/product_detail.dart';
import 'package:app/models/Product.dart';

List<Product> parseProducts(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) =>Product.fromMap(json)).toList();
}

Future<List<Product>> fetchProducts() async {
  print("inside future");
  // final response = await http.get(Uri.parse('http://127.0.0.1:8000/products.json'));
  // final response = await http.get(Uri.parse('http://192.168.1.105:8080/products.json'));
  final response = await http.get(Uri.parse('http://192.168.1.105:8000/api/productlist/'));
  // final response = await http.get(Uri.parse('http://172.23.0.1:8000/products.json'));
  // final response = await http.get(Uri.parse('http://172.23.128.1:8000/products.json'));
  print(response.statusCode);
  print("after response");
  if (response.statusCode == 200) {
    print("url succeed!");
    print(response.body);
    // print(parseProducts(response.body));
    return parseProducts(response.body);
    // return(response.body);
  } else {
    throw Exception('Unable to fetch products from the Rest API');
  }
}

// class Products extends StatelessWidget {
//   final Future<List<Product>> products;
//   Products({Key key, this.products}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: product_list.length,
//         gridDelegate:
//         new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: SingleProduct(
//               product_name: product_list[index]['name'],
//               product_image: product_list[index]['image'],
//               product_price: product_list[index]['price'],
//             ),
//           );
//         });
//   }
// }


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list1 = fetchProducts();

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
    // return GridView.builder(
    //     // itemCount: product_list1.length,
    //     itemCount: product_list.length,
    //     gridDelegate:
    //         new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //     itemBuilder: (BuildContext context, int index) {
    //       return Padding(
    //         padding: const EdgeInsets.all(4.0),
    //         child: SingleProduct(
    //           product_name: product_list[index]['name'],
    //           product_image: product_list[index]['image'],
    //           product_price: product_list[index]['price'],
    //         ),
    //       );
    //     });
    return Container(
      child: FutureBuilder<List<Product>>(
        future: product_list1,
        builder: (context, snapshot){
          // if (snapshot.error) print(snapshot.error);
          if (snapshot.hasData) {
            return ProductList(items: snapshot.data);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> items;
  ProductList({Key key, this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // itemCount: product_list1.length,
        itemCount: items.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ProductTile(item: items[index]),
          );
        });
  }
}

class ProductTile extends StatelessWidget {
  final Product item;
  ProductTile({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: this.item.name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new ProductDetails(
                  product_detail_name: this.item.name,
                  product_detail_image: this.item.image,
                  product_detail_price: this.item.price,
                  product_detail_content: this.item.description,
                ))),
            child: GridTile(
              footer: Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 8.0),
                child: Container(
                  color: Colors.white70,
                  child: new Row(children: <Widget>[
                    Expanded(
                        child: Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),)
                    ),
                    new Text("\$${this.item.price}", style: TextStyle(color: Colors.red),)
                  ],),
                ),
              ),
              child: Image.network(
                this.item.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
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
