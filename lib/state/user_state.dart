import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class UserState with ChangeNotifier{
  LocalStorage storage = new LocalStorage('usertoken');

  Future<bool> loginNow(String name, String pass) async {
    // server url
    String url = 'http://159.223.84.21:8000/api/login/';
    // local url
    // String url = 'http://10.0.2.2:8000/api/login/';
    try{
      http.Response response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': "application/json",
        },
        body: json.encode({
          "username": name,
          "password": pass
        })
      );
      var data = json.decode(response.body) as Map;
      print(data);
      if(data.containsKey("token")){
        storage.setItem("token", data['token']);
        print(storage.getItem('token'));
        return true;
      }
      return false;
    } catch (e) {
      print("e login now");
      print(e);
      return false;
    }
  }

  Future<bool> registerNow(String username, String pass, String name, String phone, String jela, String upojela) async {
    // server url
    String url = 'http://159.223.84.21:8000/api/register/';
    // local url
    // String url = 'http://10.0.2.2:8000/api/register/';
    try{
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': "application/json",
          },
          body: json.encode({
            "username": username,
            "password": pass,
            "name": name,
            "phone": phone,
            "jela": jela,
            "upojela": upojela
          })
      );
      var data = json.decode(response.body) as Map;
      print(data);
      if(data["Error"] == false){
        return true;
      }
      return false;
    } catch (e) {
      print("e register now");
      print(e);
      return false;
    }
  }
}