import 'package:flutter/material.dart';

import 'package:app/components/cart_product.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Shopping Cart'),
        actions: <Widget>[
          // new IconButton(
          //     icon: Icon(
          //       Icons.search,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {}),
        ],
      ),
      body: new Cart_product(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: new Text("Total: "),
                subtitle: new Text("\$320"),
              )),
              Expanded(
                child: new MaterialButton(
                  onPressed: () {},
                  child: new Text(
                    "Check out",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
