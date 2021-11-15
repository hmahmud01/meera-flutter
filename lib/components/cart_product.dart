import 'package:flutter/material.dart';

class Cart_product extends StatefulWidget {
  @override
  _Cart_productState createState() => _Cart_productState();
}

class _Cart_productState extends State<Cart_product> {
  var cart_products = [
    {
      "name": "product-1",
      "image": "images/products/carrot.jpeg",
      "price": 14.0,
      "qty": 4,
    },
    {
      "name": "product-2",
      "image": "images/products/cabbage.jpg",
      "price": 14.0,
      "qty": 4,
    },
    {
      "name": "product-3",
      "image": "images/products/cucumber.jpg",
      "price": 14.0,
      "qty": 4,
    },
    {
      "name": "product-4",
      "image": "images/products/eggplant.jpg",
      "price": 14.0,
      "qty": 4,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: cart_products.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            product_name: cart_products[index]["name"],
            product_image: cart_products[index]["image"],
            product_price: cart_products[index]["price"],
            product_qty: cart_products[index]["qty"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final product_name;
  final product_image;
  final product_price;
  final product_qty;

  SingleCartProduct(
      {this.product_name,
      this.product_image,
      this.product_price,
      this.product_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(product_image, width: 40.0, height: 40.0,),
        title: new Text(product_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Text("Price:")),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text("\$$product_price"),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: new Text("Quantity:")),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text("${product_qty}"),
                ),
              ],
            ),
            // new Container(
            //   alignment: Alignment.topLeft,
            //   child:  new Text("${product_price}",
            //   style: TextStyle(
            //     fontSize: 17.0,
            //     fontWeight: FontWeight.bold,
            //
            //   ),),
            // )
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            Expanded(child: new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){})),
            Expanded(child: new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})),
          ],
        ),
      ),
    );
  }
}
