import 'package:app/screens/cart_screens.dart';
import 'package:app/state/cart_state.dart';
import 'package:app/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/state/product_state.dart';

import 'order_screens.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/product-details-screen';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductState>(context).singleProduct(id);
    final cart = Provider.of<CartState>(context).cartModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('${product.name}'),
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
                  "${product.category.title} - ${product.name}",
                  style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w800, fontSize: 24.0),
                ),
              ),
            ),
            Divider(),
            Image.network("http://10.0.2.2:8000${product.thumbImage}",
            fit: BoxFit.cover,
            height: 180),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(product.description),
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
                          Text("মূল্য : "),
                          Text("${product.price.toString()}",
                          style: TextStyle(backgroundColor: Colors.black12,),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("নাম : "),
                          Text(" ${product.name}",
                            style: TextStyle(backgroundColor: Colors.black12,),)
                        ],
                      ),
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
                            onPressed: (){
                              Provider.of<CartState>(context, listen: false).addToCart(id);
                            },
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
                // RaisedButton.icon(
                //   color: Colors.black54,
                //   onPressed: (){
                //     Provider.of<CartState>(context, listen: false).addToCart(id);
                //   },
                //   icon: Icon(
                //     Icons.shopping_cart,
                //     color: Colors.white,
                //     ),
                //   label: Text("Add To Cart", style: TextStyle(
                //     color: Colors.white
                //   ),),
                // )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: HomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
