import 'package:app/screens/favourite_screens.dart';
import 'package:app/screens/home_screens.dart';
import 'package:app/screens/login_screens.dart';
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
          AppBar(
            title: Text("Welcome"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            trailing: Icon(Icons.favorite, color: Colors.orange),
            title: Text("Favourite"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FavouriteScreens.routeName);
            },
          ),
          ListTile(
            trailing: Icon(Icons.home, color: Colors.blueGrey),
            title: Text("Home"),
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
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
