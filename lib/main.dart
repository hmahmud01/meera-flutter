import 'package:flutter/material.dart';
import 'pages/home.dart';
import './pages/login.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login()
    )
  );
}