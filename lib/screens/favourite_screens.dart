import 'package:app/state/product_state.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/home_button.dart';
import 'package:app/widgets/singleProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_screens.dart';

class FavouriteScreens extends StatelessWidget {
  static const routeName = '/favourite-screen';

  @override
  Widget build(BuildContext context) {
    final favourite = Provider.of<ProductState>(context).favourites;
    return favourite.length == 0
        ? Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("No Product Found")
      ),
      body: Center(
          child: Text("No Product")
      ),
    )
        : Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('MAI SEED'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart)
          )
        ],
      ),
      body:
      Column(
        children: [
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                "আপনার পছন্দের প্রোডাক্ট",
                style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w800, fontSize: 32.0),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                "প্রয়োজন অনুযায়ী বীজ কেনার জন্য ছবির উপর প্রেস করুন",
                style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w200, fontSize: 14.0),
              ),
            ),
          ),
          Divider(),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1/1.4,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: favourite.length,
                  itemBuilder: (ctx, i) => SingleProduct(
                    id: favourite[i].id,
                    name: favourite[i].name,
                    image: favourite[i].thumbImage,
                    price: favourite[i].price,
                    qty: favourite[i].packSize.size,
                    stock: favourite[i].invStock,
                    favourite: favourite[i].favourite,
                  )),
            ),
          ),
        ],
      ),
      floatingActionButton: HomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
