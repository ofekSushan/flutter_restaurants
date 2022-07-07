import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';



class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

 final appbar = AppBar(
      title: Text(
        "categories",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );

    return Scaffold(
      appBar: appbar,
      body: GridView(
        padding: const  EdgeInsets.all(22),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                id: catData.id,
                title: catData.title,
                color: catData.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
