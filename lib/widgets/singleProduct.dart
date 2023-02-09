import 'package:app/screens/product_details_screens.dart';
import 'package:app/state/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class SingleProduct extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final double price;
  final String qty;
  final int stock;
  final bool favourite;

  const SingleProduct({Key key, this.id, this.name, this.image, this.price, this.qty, this.stock, this.favourite}) : super(key: key);

  String _status () {
    if (stock > 20 ){
      return "Available";
    }else if (stock <= 20){
      return "Limited Available";
    }else if (stock <= 0){
      return "Not Available";
    }
  }

  @override
  Widget build(BuildContext context) {
    // return GridTile(
    //   child: GestureDetector(
    //     onTap: (){
    //       Navigator.of(context).pushNamed(
    //           ProductDetails.routeName,
    //           arguments: id
    //       );
    //     },
    //       child: Image.network("http://10.0.2.2:8000$image", fit: BoxFit.cover,),
    //       // child: Image.network("http://159.223.84.21:8000$image", fit: BoxFit.cover,)
    //   ),
    //   footer: GridTileBar(
    //     backgroundColor: Colors.black54,
    //     title: Text(name , style: TextStyle(fontFamily: 'NatoSans'),),
    //     leading: IconButton(
    //       onPressed: () {
    //         Provider.of<ProductState>(context, listen: false).favouriteButton(id);
    //       },
    //       icon: Icon(
    //         favourite? Icons.favorite : Icons.favorite_outline_rounded,
    //         color: Colors.red,
    //       )
    //     ),
    //   ),
    // );
    // return Container(
    //   child: Card(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         const ListTile(
    //           leading: Icon(Icons.album),
    //           title: Text("text", style: TextStyle(fontFamily: 'NatoSans'),),
    //
    //         )
    //       ],
    //     ),
    //   ),
    // );
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(
            ProductDetails.routeName,
            arguments: id
        );
      },
      // child: Image.network("http://10.0.2.2:8000$image", fit: BoxFit.cover,),
      // child: Image.network("http://159.223.84.21:8000$image", fit: BoxFit.cover,)
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black12, width: 1.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(7),
                child: Text(utf8.decode(name.runes.toList()), style: TextStyle(fontFamily: 'NatoSans', fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Center(
                // child: Image.network("http://10.0.2.2:8000$image", height: 130, fit: BoxFit.fitWidth, alignment: Alignment.centerRight,),
                child: Image.network("http://159.223.84.21:8000$image", height: 130, fit: BoxFit.fitWidth, alignment: Alignment.centerRight,),
              ),
              // Image.network("http://10.0.2.2:8000$image", height: 130, fit: BoxFit.fitWidth, alignment: Alignment.centerRight,),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Text("Price: \$${price}", style: TextStyle(fontFamily: 'NatoSans', fontSize: 14),),
                    // IconButton(
                    //   onPressed: () {
                    //     Provider.of<ProductState>(context, listen: false).favouriteButton(id);
                    //   },
                    //   icon: Icon(
                    //     favourite? Icons.favorite : Icons.favorite_outline_rounded,
                    //     color: Colors.red,
                    //   )
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("মূল্য: ${price} ৳", style: TextStyle(fontFamily: 'NatoSans', fontSize: 12),),
                        Text("পরিমান: ${qty} ", style: TextStyle(fontFamily: 'NatoSans', fontSize: 12),),
                        // IconButton(
                        //     onPressed: () {
                        //       Provider.of<ProductState>(context, listen: false).favouriteButton(id);
                        //     },
                        //     icon: Icon(
                        //       favourite? Icons.favorite : Icons.favorite_outline_rounded,
                        //       color: Colors.red,
                        //     )
                        // ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_status(), style: TextStyle(fontFamily: 'NatoSans', fontSize: 12),),
                        IconButton(
                            onPressed: () {
                              Provider.of<ProductState>(context, listen: false).favouriteButton(id);
                            },
                            icon: Icon(
                              favourite? Icons.favorite : Icons.favorite_outline_rounded,
                              color: Colors.red,
                            )
                        ),
                      ],
                    ),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
