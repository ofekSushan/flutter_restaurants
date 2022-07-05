import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categorytitle;

  // CategoryMealsScreen({required this.categoryId, required this.categorytitle});

  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categorytitle = routes["title"];
    final categoryId = routes["id"];
    final specificMeal = DUMMY_MEALS.where(((meal) {
      return meal.categories.contains(categoryId);
    })).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
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
