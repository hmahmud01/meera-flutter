import 'package:app/screens/cart_screens.dart';
import 'package:app/state/cart_state.dart';
import 'package:app/state/product_state.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/singleCategory.dart';
import 'package:app/widgets/singleProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatefulWidget {
  static const routeName = '/home-screens/';

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  bool _init = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() async{
    if(_init){
      Provider.of<ProductState>(context, listen: false).getCategoryData();
      Provider.of<CartState>(context).getCartDatas();
      Provider.of<CartState>(context).getoldOrders();
      _isLoading = await Provider.of<ProductState>(context).getProducts();
      setState(() {});
    }
    _init=false;
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final product = Provider.of<ProductState>(context).product;
    final category = Provider.of<ProductState>(context).category;
    print(product);
    if(!_isLoading)
      return Scaffold(
        appBar: AppBar(title: Text("MAI SEED")),
        body: Center(child: Text("Something is wrong"))
      );

    else
      return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.red,
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
        body: Column(
          children: [
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "প্রোডাক্ট",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0),
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "প্রয়োজন অনুযায়ী বীজ কেনার জন্য ছবির উপর প্রেস করুন",
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12.0),
                ),
              ),
            ),
            Divider(),
            Container(
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3/2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: category.length,
                  itemBuilder: (ctx, i) => SingleCategory(category[i])),
            ),
          ],
        )
      );
  }
}
