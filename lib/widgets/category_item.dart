

import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({required this.title, required this.color, required this.id});


  void selectCategory(context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
        arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    // InkWell is "Container button"
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: (() => selectCategory(context)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 5.5)),
      ),
    );
  }
}
