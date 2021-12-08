import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/state/product_state.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/product-details-screen';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final product = Provider.of<ProductState>(context).singleProduct(id);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details")
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Image.network("http://10.0.2.2:8000${product.thumbImage}",
            fit: BoxFit.cover,
            height: 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Selling Price : ${product.price.toString()} "),
                    Text("Name : ${product.name}"),
                  ]
                ),
                RaisedButton.icon(
                  color: Colors.black54,
                  onPressed: (){},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    ),
                  label: Text("Add To Cart", style: TextStyle(
                    color: Colors.white
                  ),),
                )
              ],
            ),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
