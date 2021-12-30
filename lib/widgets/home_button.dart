import 'package:app/screens/home_screens.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
      },
      tooltip: 'হোম',
      backgroundColor: Colors.redAccent,
      child: Icon(Icons.home),
    );
  }
}
