import 'package:app/screens/home_screens.dart';
import 'package:app/screens/order_screens.dart';
import 'package:app/state/cart_state.dart';
import 'package:app/widgets/home_button.dart';
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
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text('MAI SEED'),
          actions: [
            FlatButton.icon(onPressed: null, icon: Icon(Icons.shopping_cart, color: Colors.white,), label: Text("${cart.cartproducts.length}", style: TextStyle(color: Colors.white),)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
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
                          Image.network("http://10.0.2.2:8000${item.product[0].thumbImage}", width: 56.0, height: 56.0,),
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
                            onPressed: (){
                              Provider.of<CartState>(context, listen: false).deleteCartProduct(item.id);
                            },
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
        ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Total: ${cart.total}"),
              Text("Date: ${cart.date}"),
              RaisedButton(
                color: Colors.blue,
                onPressed: cart.cartproducts.length<=0?null : (){
                  Navigator.of(context).pushNamed(Order.routeName);
                },
                child: Text("Order"),),
              RaisedButton(
                color: Colors.red,
                onPressed: cart.cartproducts.length<=0?null : ()async{
                  bool isdelete = await Provider.of<CartState>(context, listen: false).deleteCart(cart.id);
                  if(isdelete){
                    Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
                  }
                },
                child: Text("Delete"),)
            ],
          ),
      );
  }
}
