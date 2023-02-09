import 'dart:convert';

import 'package:app/models/cart.dart';
import 'package:app/models/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class CartState with ChangeNotifier{
  LocalStorage storage = new LocalStorage('usertoken');
  CartModel _cartModel;
  List<OrderModel> _orders;

  Future<void> getCartDatas() async {
    // String url = 'http://10.0.2.2:8000/api/cart/';
    String url = 'http://159.223.84.21:8000/api/cart/';
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "token $token",
      });
      var data = json.decode(response.body) as Map;
      print("cartdata");
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

  Future<void> getoldOrders() async {
    // String url = 'http://10.0.2.2:8000/api/order/';
    String url = 'http://159.223.84.21:8000/api/order/';
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "token $token",
      });
      var data = json.decode(response.body) as Map;
      List<OrderModel> demo = [];
      if (data['error'] == false) {
        data['data'].forEach((element) {
          OrderModel oldOrder = OrderModel.fromJson(element);
          demo.add(oldOrder);
        });
        _orders = demo;
        notifyListeners();
      } else {
        print(data['data']);
      }
    } catch (e) {
      print("error getoldOrders");
    }
  }

  Future<void> addToCart(int id, int qty) async{
    // String url = 'http://10.0.2.2:8000/api/addtocart/';
    String url = 'http://159.223.84.21:8000/api/addtocart/';
    var token = storage.getItem('token');
    print(qty);
    try{
      http.Response response = await http.post(
          Uri.parse(url),
          body: json.encode({'id': id, 'qty': qty}),
          headers: {
            'Content-Type': "application/json",
            'Authorization' : "token $token"
          }
      );
      var data = json.decode(response.body)as Map;
      print("adding cart");
      print(data);
      print(data['error']);
      if (data['error']==false){
        getCartDatas();
      }
    } catch (e){
      print("e add to cart");
      print(e);
    }
  }

  Future<void> deleteCartProduct(int id) async{
    // String url = 'http://10.0.2.2:8000/api/deletecartproduct/';
    String url = 'http://159.223.84.21:8000/api/deletecartproduct/';
    var token = storage.getItem('token');

    try{
      http.Response response = await http.post(
          Uri.parse(url),
          body: json.encode({'id': id}),
          headers: {
            'Content-Type': "application/json",
            'Authorization' : "token $token"
          }
      );
      var data = json.decode(response.body)as Map;
      print(data['error']);
      if (data['error']==false){
        getCartDatas();
      }
    } catch (e){
      print("e add to cart");
      print(e);
    }
  }

  Future<bool> deleteCart(int id) async{
    // String url = 'http://10.0.2.2:8000/api/deletecart/';
    String url = 'http://159.223.84.21:8000/api/deletecart/';
    var token = storage.getItem('token');

    try{
      http.Response response = await http.post(
          Uri.parse(url),
          body: json.encode({'id': id}),
          headers: {
            'Content-Type': "application/json",
            'Authorization' : "token $token"
          }
      );
      var data = json.decode(response.body)as Map;
      print(data['error']);
      if (data['error']==false){
        getCartDatas();
        _cartModel = null;
        notifyListeners();
        return  true;
      }
      return false;
    } catch (e){
      print("e add to cart");
      print(e);
      getCartDatas();
      return false;
    }
  }

  Future<bool> orderCart(int cartid, String address, String email, String phone, String name) async{
    // String url = 'http://10.0.2.2:8000/api/ordercreate/';
    String url = 'http://159.223.84.21:8000/api/ordercreate/';
    var token = storage.getItem('token');
    print(cartid);
    try{
      http.Response response = await http.post(
          Uri.parse(url),
          body: json.encode({
            "cartid":cartid,
            "email": email,
            "address":address,
            "phone":phone,
            "name":name,
          }),
          headers: {
            'Content-Type': "application/json",
            'Authorization' : "token $token"
          }
      );
      var data = json.decode(response.body)as Map;
      print(data['error']);
      if (data['error']==false){
        getCartDatas();
        getoldOrders();
        _cartModel = null;
        notifyListeners();
        return true;
      }
      return false;
    } catch (e){
      print("e add to cart");
      print(e);
      return false;
    }
  }

  CartModel get cartModel {
    if(_cartModel != null){
      return _cartModel;
    }else{
      return null;
    }
  }


  List<OrderModel> get oldorder {
    if(_orders != null){
      return [..._orders];
    }else{
      return null;
    }
  }

}