import 'package:app/screens/product_details_screens.dart';
import 'package:app/state/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final double price;
  final bool favourite;

  const SingleProduct({Key key, this.id, this.name, this.image, this.price, this.favourite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(
              ProductDetails.routeName,
              arguments: id
          );
        },
          child: Image.network("http://10.0.2.2:8000$image", fit: BoxFit.cover,)
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(name , style: TextStyle(fontFamily: 'NatoSans'),),
        leading: IconButton(
          onPressed: () {
            Provider.of<ProductState>(context, listen: false).favouriteButton(id);
          },
          icon: Icon(
            favourite? Icons.favorite : Icons.favorite_outline_rounded,
            color: Colors.red,
          )
        ),
      ),
    );
  }
}
