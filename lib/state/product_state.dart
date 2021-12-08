import 'package:app/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class ProductState with ChangeNotifier{
  LocalStorage storage = new LocalStorage('usertoken');
  List<Product> _products = [];

  Future<bool> getProducts() async{
    // String url = 'http://127.0.0.1:8000/api/products/';
    // String url = 'http://192.168.1.105:8000/api/products/';
    String url = 'http://10.0.2.2:8000/api/products/';
    var token = storage.getItem('token');
    try{
      http.Response response = await http.get(Uri.parse(url), headers: {
        'Authorization' : "token $token",
      });
      List<Product> temp = [];
      var data = json.decode(response.body) as List;
      print(data);
      data.forEach((element) {
          print(element);
          Product product = Product.fromJson(element);
          temp.add(product);
      });
      _products = temp;
      notifyListeners();
      return true;
    }catch(e){
      print("get products");
      print(e);
      return false;
    }
  }

  Future<void> favouriteButton(int id) async{
    // String url = 'http://127.0.0.1:8000/api/products/';
    // String url = 'http://192.168.1.105:8000/api/products/';
    String url = 'http://10.0.2.2:8000/api/favourite/';
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
      var data = json.decode(response.body);
      // print(data);
      getProducts();
    }catch(e){
      print("e Favouritebutton");
      print(e);
    }
  }

  List<Product> get product{
    return [..._products];
  }

  List<Product> get favourites{
    return _products.where((element) => element.favourite==true).toList();
  }

  Product singleProduct(int id){
    return _products.firstWhere((element) => element.id==id);
  }


}