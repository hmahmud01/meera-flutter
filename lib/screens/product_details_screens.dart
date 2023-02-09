import 'package:app/screens/cart_screens.dart';
import 'package:app/state/cart_state.dart';
import 'package:app/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/state/product_state.dart';
import 'dart:convert';

import 'order_screens.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/product-details-screen';
  int _qty = 0;
  final _form = GlobalKey<FormState>();

  bool isEnabled(int qty){
    if (qty <= 0) {
      return false;
    }else{
      return true;
    }
  }



  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductState>(context).singleProduct(id);
    final cart = Provider.of<CartState>(context).cartModel;

    var name = utf8.decode(product.name.runes.toList());
    var cat = utf8.decode(product.category.title.runes.toList());
    var desc = utf8.decode(product.description.runes.toList());

    addToCart(){
      var isvalid = _form.currentState.validate();
      if (!isvalid) {
        return;
      }
      _form.currentState.save();
      Provider.of<CartState>(context, listen: false).addToCart(id, _qty);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('প্রোডাক্ট টি কার্টে যোগ করা হয়েছে'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('${name}'),
        actions: [
          FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart, color: Colors.white,),
              label:
              Text(
                cart!=null ? "${cart.cartproducts.length}" : '',
                style: TextStyle(color: Colors.white),)
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "${cat} - ${name}",
                  style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w800, fontSize: 24.0),
                ),
              ),
            ),
            Divider(),
            Center(
              // child: Image.network("http://10.0.2.2:8000$image", height: 130, fit: BoxFit.fitWidth, alignment: Alignment.centerRight,),
              // child: Image.network("http://10.0.2.2:8000${product.thumbImage}", height: 270, fit: BoxFit.fitWidth, alignment: Alignment.centerRight,),
              child: Image.network("http://159.223.84.21:8000${product.thumbImage}", height: 270, fit: BoxFit.fitWidth, alignment: Alignment.centerRight,),
            ),
            // Image.network("http://10.0.2.2:8000${product.thumbImage}",
            // Image.network("http://159.223.84.21:8000${product.thumbImage}",

                // fit: BoxFit.cover,
                // height: 180),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(desc,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("প্রোডাক্টের মূল্য: ${product.price.toString()} টাকা (প্রতি পিছ)",),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("স্টক : ${product.invStock.toString()} (পিছ)"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("নাম : ${name}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("পরিমাণ : ${product.packSize.qty} গ্রাম"),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Form(
                              key: _form,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 200,
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          hintText: "পরিমাণ নির্ধারন করুন",
                                          hintStyle: TextStyle(
                                              fontSize: 12,
                                          )
                                      ),
                                      validator: (v){
                                        if (v.isEmpty){
                                          return "";
                                        }else if ( int.parse(v) > product.invStock) {
                                          return "অতিরিক্ত পরিমান নির্ধারিত";
                                        } else {
                                          return null;
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      onSaved: (v){
                                        _qty = int.parse(v);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),


                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Expanded(
                      //       child: Column(
                      //         children: [
                      //           Form(
                      //             key: _form,
                      //             child: Column(
                      //               children: [
                      //                 Container(
                      //                   child: TextFormField(
                      //                     validator: (v){
                      //                       if(v.isEmpty){
                      //                         return ;
                      //                       }
                      //                       return null;
                      //                     },
                      //                     decoration: InputDecoration(
                      //                       hintText: "",
                      //                       icon: Icon(Icons.phone),
                      //                     ),
                      //                     keyboardType: TextInputType.number,
                      //                     onSaved: (v){
                      //                       _qty = int. parse(v);
                      //                     },
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       )
                      //     ),
                      //     // Text("Order Qty : "),
                      //
                      //     // Text(" ${product.packSize.size}",
                      //     //   style: TextStyle(backgroundColor: Colors.black12,),)
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton.icon(
                            color: Colors.red,
                            onPressed: (){
                              Navigator.of(context).pushNamed(Order.routeName);
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            label: Text("মূল্য পরিশোধ করুন", style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                          RaisedButton.icon(
                            color: Colors.red,
                            onPressed: isEnabled(product.invStock) ? ()=> addToCart() : null,
                            icon: Icon(
                              Icons.monetization_on_outlined,
                              color: Colors.white,
                            ),
                            label: Text("শপিং কার্টে রাখুন", style: TextStyle(
                                color: Colors.white
                            ),),
                          )
                        ],
                      ),

                    ]
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: HomeButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
