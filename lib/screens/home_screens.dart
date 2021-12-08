import 'package:app/screens/cart_screens.dart';
import 'package:app/state/cart_state.dart';
import 'package:app/state/product_state.dart';
import 'package:app/widgets/app_drawer.dart';
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
      Provider.of<CartState>(context).getCartDatas();
      _isLoading = await Provider.of<ProductState>(context).getProducts();
      setState(() {});
    }
    _init=false;
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    final product = Provider.of<ProductState>(context).product;
    print(product);
    if(!_isLoading)
      return Scaffold(
        appBar: AppBar(title: Text("Welcome to Shop")),
        body: Center(child: Text("Something is wrong"))
      );

    else
      return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            title: Text("Welcome to Shop"),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(Icons.shopping_cart)
            )
          ],
        ),
        body: GridView.builder(
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
            ))
      );
  }
}
