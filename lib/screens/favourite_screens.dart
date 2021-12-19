import 'package:app/state/product_state.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:app/widgets/singleProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreens extends StatelessWidget {
  static const routeName = '/favourite-screen';

  @override
  Widget build(BuildContext context) {
    final favourite = Provider.of<ProductState>(context).favourites;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('MAI SEED'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3/2,
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
              favourite: favourite[i].favourite,
            )),
      ),
    );
  }
}
