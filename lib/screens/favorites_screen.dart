import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';


class FavoritesScreen extends StatelessWidget {
  final List <Meal> favorites;

  FavoritesScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
      if(favorites.isEmpty){
    return Center(
      child: Text(" You Have No Favorites"),
    );
      }
      else {
        return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favorites[index].id,
            title: favorites[index].title,
            imageURl: favorites[index].imageUrl,
            duration: favorites[index].duration,
            affordability: favorites[index].affordability,
            complexity: favorites[index].complexity,
          );
        },
        itemCount: favorites.length,
      );
      }
  }
}
