import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation_app/models/meal.dart';
import '../widgets/steps.dart';
import '../widgets/ingredients.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/category-meals-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(text,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Theme.of(context).colorScheme.primary)));
  }

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId["id"]);

    final appbar = AppBar(
      title: Text(
        mealId["title"],
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
    return Scaffold(
        appBar: appbar,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                height:MediaQuery.of(context).size.height * 0.35, 
                width: double.infinity,
                child: Image.network(
                  mealId["imageURl"],
                  fit: BoxFit.cover,
                )),
            ingredients(
              selectedMeal: selectedMeal,
              buildSectionTitle: buildSectionTitle,
            ),
            Steps(
                selectedMeal: selectedMeal,
                buildSectionTitle: buildSectionTitle),
          ]),
        ));
  }
}
