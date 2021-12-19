import 'package:app/models/Product.dart';
import 'package:app/screens/category_screens.dart';
import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  final Category category;
  SingleCategory(this.category);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            CategoryScreens.routeName,
            arguments: category.id,
          );
        },
        child: Card(
          color: Theme.of(context).accentColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
