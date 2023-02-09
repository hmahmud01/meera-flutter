import 'package:app/models/Product.dart';
import 'package:app/screens/category_screens.dart';
import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  final Category category;
  SingleCategory(this.category);
  @override
  Widget build(BuildContext context) {
    if(category.thumbImage == null){
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
    }else{
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridTile(
          child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(
                  CategoryScreens.routeName,
                  arguments: category.id,
                );
              },
              // child: Image.network("http://10.0.2.2:8000${category.thumbImage}", fit: BoxFit.cover,)
              child: Image.network("http://159.223.84.21:8000${category.thumbImage}", fit: BoxFit.cover,)

          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(category.title , style: TextStyle(fontFamily: 'NatoSans'),),
          ),
        ),
      );
    }
  }
}
