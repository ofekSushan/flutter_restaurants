
import 'package:flutter/material.dart';
import '../models/meal.dart';

class ingredients extends StatelessWidget {
  
  final Meal selectedMeal;
  final Function buildSectionTitle;

  ingredients({required this.selectedMeal,required this.buildSectionTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSectionTitle(context,"Ingredients"),
        Container(
          height: MediaQuery.of(context).size.height * 0.29,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          child: ListView.builder(
            itemBuilder: ((context, index) => Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 15),
                    child: Text(
                      selectedMeal.ingredients[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor),
                    ),
                  ),
                )),
            itemCount: selectedMeal.ingredients.length,
          ),
        ),
      ],
    );
  }
}
