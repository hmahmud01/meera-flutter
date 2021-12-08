import 'dart:convert';

import 'package:app/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class CartState with ChangeNotifier{
  LocalStorage storage = new LocalStorage('usertoken');
  CartModel _cartModel;
  Future<void> getCartDatas() async {
    String url = 'http://10.0.2.2:8000/api/cart/';
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "token $token",
      });
      var data = json.decode(response.body) as Map;
      print(data);
      print(data['error']);
      List<CartModel> demo = [];
      if (data['error'] == false) {
        data['data'].forEach((element) {
          CartModel cartModel = CartModel.fromJson(element);
          demo.add(cartModel);
        });
        _cartModel = demo[0];
        notifyListeners();
      } else {
        print(data['data']);
      }
    } catch (e) {
      print("error getCartDatas");
    }
  }

  CartModel get cartModel {
    if(_cartModel != null){
      return _cartModel;
    }else{
      return null;
    }
  }

}