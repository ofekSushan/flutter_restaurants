import 'package:flutter/material.dart';
import '../models/meal.dart';

class Steps extends StatelessWidget {
  final Meal selectedMeal;
  final Function buildSectionTitle;

  Steps({required this.selectedMeal, required this.buildSectionTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          buildSectionTitle(context, "Steps"),
          Container(
              height: MediaQuery.of(context).size.height * 0.007 +
                  selectedMeal.steps.length * 64,
              width: MediaQuery.of(context).size.width * 5,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          textColor: Theme.of(context).backgroundColor,
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text(
                            selectedMeal.steps[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                         const Divider()
                      ],
                    )),
                itemCount: selectedMeal.steps.length,
              )),
        ],
      ),
    );
  }
}
