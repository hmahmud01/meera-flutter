import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            cat_image: 'images/cats/accessories.png',
            cat_name: 'Carrot',
          ),
          Category(
            cat_image: 'images/cats/accessories.png',
            cat_name: 'Cucumber',
          ),
          Category(
            cat_image: 'images/cats/accessories.png',
            cat_name: 'cabbage',
          ),
          Category(
            cat_image: 'images/cats/accessories.png',
            cat_name: 'Eggplant',
          ),
          Category(
            cat_image: 'images/cats/accessories.png',
            cat_name: 'Tomato',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String cat_image;
  final String cat_name;

  Category({this.cat_image, this.cat_name});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),

      child: Material(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(25.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 120.0,
            child: ListTile(
              title: Center(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text(cat_name,
                    style: TextStyle(fontSize: 14.0),
                    ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
