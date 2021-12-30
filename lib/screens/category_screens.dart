import 'package:app/screens/cart_screens.dart';
import 'package:app/state/product_state.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/home_button.dart';
import 'package:app/widgets/singleProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreens extends StatefulWidget {
  static const routeName = '/category-screens';

  @override
  _CategoryScreensState createState() => _CategoryScreensState();
}

class _CategoryScreensState extends State<CategoryScreens> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductState>(context).categoryposts(id);

    return product.length == 0
        ? Scaffold(
            appBar: AppBar(
              title: Text("No Product Found")
            ),
            body: Center(
              child: Text("No Product")
            ),
        )
        : Scaffold(
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
                  "${product[0].category.title}",
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
                  style: TextStyle(fontFamily: 'NatoSans', fontWeight: FontWeight.w200, fontSize: 16.0),
                ),
              ),
            ),
            Divider(),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3/2,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: product.length,
                    itemBuilder: (ctx, i) => SingleProduct(
                      id: product[i].id,
                      name: product[i].name,
                      image: product[i].thumbImage,
                      price: product[i].price,
                      favourite: product[i].favourite,
                    )),
              ),
            ),
          ],
        ),
        floatingActionButton: HomeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: GridView.builder(
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         childAspectRatio: 3/2,
        //         crossAxisCount: 2,
        //         crossAxisSpacing: 10,
        //         mainAxisSpacing: 10,
        //       ),
        //       itemCount: product.length,
        //       itemBuilder: (ctx, i) => SingleProduct(
        //         id: product[i].id,
        //         name: product[i].name,
        //         image: product[i].thumbImage,
        //         price: product[i].price,
        //         favourite: product[i].favourite,
        //       )),
        // )
    );
  }
}
