import 'package:app/pages/registration.dart';
import 'package:app/screens/cart_screens.dart';
import 'package:app/screens/category_screens.dart';
import 'package:app/screens/favourite_screens.dart';
import 'package:app/screens/home_screens.dart';
import 'package:app/screens/login_screens.dart';
import 'package:app/screens/order_history_screens.dart';
import 'package:app/screens/order_screens.dart';
import 'package:app/screens/product_details_screens.dart';
import 'package:app/screens/registration_screens.dart';
import 'package:app/state/cart_state.dart';
import 'package:app/state/product_state.dart';
import 'package:app/state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import './pages/login.dart';

// void main(){
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Login()
//     )
//   );
// }

main () => runApp(Myapp());

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    LocalStorage storage = new LocalStorage('usertoken');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=>ProductState()),
        ChangeNotifierProvider(create: (ctx)=>UserState()),
        ChangeNotifierProvider(create: (ctx)=>CartState())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: storage.ready,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (storage.getItem('token') == null) {
              return LoginScreens();
            }
            return HomeScreens();
          },
        ),
        routes: {
          HomeScreens.routeName: (ctx) => HomeScreens(),
          ProductDetails.routeName: (ctx) => ProductDetails(),
          FavouriteScreens.routeName: (ctx) => FavouriteScreens(),
          LoginScreens.routeName: (ctx) => LoginScreens(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreens.routeName: (ctx) => OrderScreens(),
          Order.routeName: (ctx) => Order(),
          CategoryScreens.routeName: (ctx) => CategoryScreens()
        },
      ),
    );
  }
}
