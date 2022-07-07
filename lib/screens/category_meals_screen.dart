import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categorytitle = routes["title"];
    final categoryId = routes["id"];
    final specificMeal = DUMMY_MEALS.where(((meal) {
      return meal.categories.contains(categoryId);
    })).toList();

    final appbar = AppBar(
      title: Text(
        categorytitle!,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
    return Scaffold(
      appBar: appbar,
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: specificMeal[index].id,
              title: specificMeal[index].title,
              imageURl: specificMeal[index].imageUrl,
              duration: specificMeal[index].duration,
              complexity: specificMeal[index].complexity,
              affordability: specificMeal[index].affordability);
        },
        itemCount: specificMeal.length,
      ),
    );
  }
}
