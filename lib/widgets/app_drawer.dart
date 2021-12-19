import 'package:app/screens/favourite_screens.dart';
import 'package:app/screens/home_screens.dart';
import 'package:app/screens/login_screens.dart';
import 'package:app/screens/order_history_screens.dart';
import 'package:app/screens/order_screens.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  LocalStorage storage = new LocalStorage('usertoken');

  void _logoutNow() async{
    await storage.clear();
    Navigator.of(context).pushReplacementNamed(LoginScreens.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          new UserAccountsDrawerHeader(
            accountName: Text('Username'),
            accountEmail: Text('user@email.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: new BoxDecoration(color: Colors.red),
          ),
          ListTile(
            trailing: Icon(Icons.favorite, color: Colors.orange),
            title: Text("পছন্দের প্রডাক্ট"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FavouriteScreens.routeName);
            },
          ),
          ListTile(
            trailing: Icon(Icons.lock_clock, color: Colors.blue),
            title: Text("আমার অর্ডার"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrderScreens.routeName);
            },
          ),
          ListTile(
            trailing: Icon(Icons.home, color: Colors.blueGrey),
            title: Text("হোম"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
            },
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.list, color: Colors.greenAccent),
            title: Text("শর্তাবলী"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
            },
          ),
          ListTile(
            trailing: Icon(Icons.info_outline, color: Colors.greenAccent),
            title: Text("তত্থ"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
            },
          ),
          Spacer(),
          ListTile(
            onTap: () {
              _logoutNow();
            },
            trailing: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: Text("লগ আউট করুন"),
          ),
        ],
      ),
    );
  }
}
