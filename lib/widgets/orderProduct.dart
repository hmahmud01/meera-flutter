import 'package:app/state/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:app/models/order.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class OrderProduct extends StatelessWidget {

  final List<Cartproducts> items;
  const OrderProduct({this.items});
  @override
  Widget build(BuildContext context) {
    var dot = String.fromCharCode(0x2022);
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (ctx, i){
            return(
                Text("${dot} নামঃ ${utf8.decode(items[i].product[0].name.runes.toList())} - পরিমানঃ ${items[i].quantity} প্যাকেট")
            );
          }
        ),
      )
    );
  }
}
