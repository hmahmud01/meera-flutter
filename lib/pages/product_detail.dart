import 'package:app/pages/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/cart.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_image;
  final product_detail_price;
  final product_detail_content;

  ProductDetails({this.product_detail_name,
    this.product_detail_image,
    this.product_detail_price,
    this.product_detail_content});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.4,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
            },
            child: Text('mai seed')
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (Context) => new Cart()));
              }),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.network(widget.product_detail_image),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "\$${widget.product_detail_price}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              // Qty Button
              Expanded(
                  child: MaterialButton(
                      onPressed: () {
                        showDialog(context: context,
                            builder: (context) {
                              return new AlertDialog(
                                title: new Text("প্যাকেট সংখ্যা"),
                                content: new Text("প্যাকেট সংখ্যা উল্লেখ করুন"),
                                actions: [
                                  new MaterialButton(onPressed: (){
                                    Navigator.of(context).pop(context);
                                  },
                                  child: new Text("Save"),
                                  )
                                ],
                              );
                            });
                      },
                      color: Colors.white,
                      textColor: Colors.grey,
                      elevation: 0.2,
                      child: Row(
                        children: [
                          Expanded(child: new Text("প্যাকেট সংখ্যা")),
                          Expanded(
                              child: new Icon(Icons.arrow_drop_down_circle))
                        ],
                      )
                  )
              ),
              // Weight Button
              // Expanded(
              //     child: MaterialButton(
              //         onPressed: () {
              //           showDialog(context: context,
              //               builder: (context) {
              //                 return new AlertDialog(
              //                   title: new Text("Qty"),
              //                   content: new Text("Please Select Weight"),
              //                   actions: [
              //                     new MaterialButton(onPressed: (){
              //                       Navigator.of(context).pop(context);
              //                     },
              //                       child: new Text("Save"),
              //                     )
              //                   ],
              //                 );
              //               });
              //         },
              //         color: Colors.white,
              //         textColor: Colors.grey,
              //         elevation: 0.2,
              //         child: Row(
              //           children: [
              //             Expanded(child: new Text("Weight")),
              //             Expanded(
              //                 child: new Icon(Icons.arrow_drop_down_circle))
              //           ],
              //         )
              //     )
              // ),
              // Color Button
              // Expanded(
              //     child: MaterialButton(
              //         onPressed: () {
              //           showDialog(context: context,
              //               builder: (context) {
              //                 return new AlertDialog(
              //                   title: new Text("Qty"),
              //                   content: new Text("Please Color"),
              //                   actions: [
              //                     new MaterialButton(onPressed: (){
              //                       Navigator.of(context).pop(context);
              //                     },
              //                       child: new Text("Save"),
              //                     )
              //                   ],
              //                 );
              //               });
              //         },
              //         color: Colors.white,
              //         textColor: Colors.grey,
              //         elevation: 0.2,
              //         child: Row(
              //           children: [
              //             Expanded(child: new Text("Color")),
              //             Expanded(
              //                 child: new Icon(Icons.arrow_drop_down_circle))
              //           ],
              //         )
              //     )
              // )
            ],
          ),


          // Padding with buy button
          new Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              children: <Widget>[
                // Qty Button
                Expanded(
                    child: MaterialButton(
                        onPressed: () {},
                        color: Colors.black87,
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: new Text("অর্ডার করুন")
                    )
                ),

                new IconButton(icon: Icon(Icons.add_shopping_cart),
                    color: Colors.black87,
                    onPressed: () {}),
                new IconButton(icon: Icon(Icons.favorite_border),
                    color: Colors.black87,
                    onPressed: () {})

              ],
            ),
          ),
          Divider(),
          new ListTile(
            title: new Text("পন্নের বর্ণনা"),
            subtitle: new Text(widget.product_detail_content),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product Brand", style: TextStyle(color: Colors.black87),),
              ),
              Padding(padding: const EdgeInsets.all(5.0), child: new Text(widget.product_detail_name),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product Category", style: TextStyle(color: Colors.black87),),
              ),
              Padding(padding: const EdgeInsets.all(5.0), child: new Text("Category"),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product Zone", style: TextStyle(color: Colors.black87),),
              ),
              Padding(padding: const EdgeInsets.all(5.0), child: new Text("Zone"),)
            ],
          )
        ],
      ),
    );
  }
}
