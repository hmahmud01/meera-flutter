import 'package:app/state/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screens';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartState>(context).cartModel;
    if (cart == null)
      return Scaffold(
        appBar: AppBar(title: Text("No Product"),),
        body: Center(
          child: Text("No Product")
        ),
      );
    else
      return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          actions: [
            FlatButton.icon(onPressed: null, icon: Icon(Icons.shopping_cart, color: Colors.white,), label: Text("${cart.cartproducts.length}", style: TextStyle(color: Colors.white),)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Total: ${cart.total}"),
                  Text("Date: ${cart.date}"),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: cart.cartproducts.length<=0?null : (){},
                    child: Text("Order"),),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: cart.cartproducts.length<=0?null : (){},
                    child: Text("Delete"),)
                ],
              ),
              Expanded(child: ListView.builder(
                itemCount: cart.cartproducts.length,
                itemBuilder: (ctx,i){
                  var item = cart.cartproducts[i];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.product[0].name),
                              Text("Price : ${item.price}"),
                              Text("Quantity : ${item.quantity}"),
                            ],
                          ),
                          RaisedButton(
                            color: Colors.redAccent,
                            onPressed: (){},
                            child: Text("Delete"),
                          )
                        ],
                      ),
                    ),
                  );
                }
              )),
            ],
          )
        )
      );
  }
}
