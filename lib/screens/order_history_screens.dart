import 'package:app/state/cart_state.dart';
import 'package:app/widgets/home_button.dart';
import 'package:app/widgets/orderProduct.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class OrderScreens extends StatelessWidget {
  static const routeName = '/order-screens';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CartState>(context).oldorder;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('MAI SEED'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                "পূর্ববর্তী অর্ডার শমুহ",
                style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w800, fontSize: 32.0),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                "আপনার পূর্বের অর্ডার গুলো নিম্নে লিস্ট আকারে সাজানো হয়েছে",
                style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w200, fontSize: 16.0),
              ),
            ),
          ),
          Divider(),
          Expanded(child: Padding(
            padding: EdgeInsets.all(12),
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (ctx, i){
                  int reverseIdx = data.length - 1 - i;
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("অর্ডার নঃ : ${data[reverseIdx].id}"),
                          Text("ফোন : ${data[reverseIdx].phone}"),
                          Text("প্রোডাক্ট সমূহ :"),
                          OrderProduct(items: data[reverseIdx].cart.cartproducts),
                          Text("মোট : ${data[reverseIdx].cart.total} ৳"),
                          Text("তারিখ : ${data[reverseIdx].cart.date}"),
                          Text("প্রগ্রেস : ${utf8.decode(data[reverseIdx].remark.runes.toList())}"),
                        ],
                      ),
                    ),
                  );
                }
            ),
          ),),

        ],
      ),
      floatingActionButton: HomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
