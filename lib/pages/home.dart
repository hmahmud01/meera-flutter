import 'package:app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:app/components/horizontal_list.dart';
import 'package:app/components/products.dart';
import 'package:app/pages/cart.dart';
import 'package:app/pages/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // carousel
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Meera App'),
        actions: <Widget>[
          // new IconButton(
          //     icon: Icon(
          //       Icons.search,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => new Cart()));
              }),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // header
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

            // body
            InkWell(
              onTap: () {
                print("Home Screen route");
              },
              child: ListTile(
                title: Text("Home"),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text("Cart"),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favourites"),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.info,
                  color: Colors.lightBlue,
                ),
              ),
            ),

            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Login()));
              },
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          // image_carousel,

          // Catgory Header
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0),
            )),
          ),

          // Category List contents
          HorizontalList(),

          Divider(),

          // Product Header
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                "Products",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0),
              ),
            ),
          ),
          Flexible(child: Products())
        ],
      ),
    );
  }
}
