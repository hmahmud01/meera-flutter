import 'package:app/screens/home_screens.dart';
import 'package:app/screens/order_screens.dart';
import 'package:app/state/cart_state.dart';
import 'package:app/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screens';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartState>(context).cartModel;

    Future<void> _confirmOrder() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('অর্ডার নিশ্চিত করুন'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('আপনার প্রোডাক্ট গুলো নির্বাচন করা শেষ হলে অর্ডার নিশ্চিত করুণ।'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('নিশ্চিত করুণ'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Order.routeName);
                },
              ),
              TextButton(
                child: Text('আরও শপিং করুণ'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _deleteCart() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('সম্পূর্ণ কার্ট মুছে ফেলুন'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('নতুন করে শপিং করার জন্য সম্পূর্ণ কার্ট টি মুহে ফেলুন।'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('নিশ্চিত করুণ'),
                onPressed: () async {
                  bool isdelete = await Provider.of<CartState>(context, listen: false).deleteCart(cart.id);
                  if(isdelete){
                    Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
                  }
                },
              ),
              TextButton(
                child: Text('ক্যানসেল করুণ'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _deleteProduct(int id) async{
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('প্রোডাক্ট মুছে ফেলুন'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('আপনার কার্ট থেকে প্রোডাক্ট টি মুছে ফেলুন।'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('নিশ্চিত করুণ'),
                onPressed: () {
                  Provider.of<CartState>(context, listen: false).deleteCartProduct(id);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('ক্যানসেল করুণ'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    if (cart == null)
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text("No Product"),
        ),
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
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    "কার্ট",
                    style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w800, fontSize: 32.0),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    "নিচের প্রোডাক্ট গুলো আপনার কার্টে যোগ করা হয়েছে",
                    style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w400, fontSize: 16.0),
                  ),
                ),
              ),

              new Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    "তারিখ: ${cart.date}",
                    style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w400, fontSize: 12.0),
                  ),
                ),
              ),
              Divider(),
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
                          // Image.network("http://10.0.2.2:8000${item.product[0].thumbImage}", width: 56.0, height: 56.0,),
                          Image.network("http://159.223.84.21:8000${item.product[0].thumbImage}", width: 56.0, height: 56.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("প্রোডাক্টের নামঃ ${utf8.decode(item.product[0].name.runes.toList())}"),
                              Text("পরিমান : ${item.quantity}"),
                              Text("সর্বমোট মূল্য: টাকা ${item.subtotal}/-"),
                            ],
                          ),
                          RaisedButton(
                            color: Colors.redAccent,
                            onPressed: () => _deleteProduct(item.id),
                            child: Text("মুছে ফেলুন", style: TextStyle(color: Colors.white)),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("মোট: ${cart.total.round()} টাকা"),
              Row(
                children: [
                  RaisedButton(
                      color: Colors.blueGrey,
                      onPressed: cart.cartproducts.length<=0?null : () => _confirmOrder(),
                      child: Text("অর্ডার করুন ", style: TextStyle(color: Colors.white))),
                  RaisedButton(
                      color: Colors.red,
                      onPressed: cart.cartproducts.length<=0?null : () => _deleteCart(),
                      child: Text("সম্পূর্ণ কার্ট মুছে ফেলুন", style: TextStyle(color: Colors.white)))
                ],
              )
            ],
          ),
      );
  }
}
