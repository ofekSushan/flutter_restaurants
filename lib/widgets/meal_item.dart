import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {required this.id,
      required this.title,
      required this.imageURl,
      required this.duration,
      required this.complexity,
      required this.affordability});

  String complexityEnumText() {
    // switch is if statement but better for alot of if
    switch (complexity) {
      case Complexity.Simple:
        return "Easy";

      case Complexity.Challenging:
        return "Fair";

      case Complexity.Hard:
        return "Hard";

      // default is if its non of them
      default:
        return "Unkown";
    }
  }

  String affordabilityEnumText() {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";

      case Affordability.Pricey:
        return "Pricey";

      case Affordability.Luxurious:
        return "Expensive";

      default:
        return "Unkown";
    }
  }

  void mealDetail(ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: {
      "id": id,
      "title": title,
      "duration": duration,
      "imageURl": imageURl
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => mealDetail(context)),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageURl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                child: Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 23, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${duration} minutes'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.workspace_premium),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityEnumText())
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityEnumText())
                    ],
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
