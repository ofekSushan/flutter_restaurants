import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "among us app",
      theme: ThemeData(
        colorSchemeSeed: Colors.cyan,
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: "Raleway",
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 30,
          ),
        ),
      ),
      // home: const CategoriesScreen(),
      routes: {
        // שאתה רושם / זה אוטמטית מתחיל את האפלקציה  בעמוד הזה
        '/':((ctx) => const CategoriesScreen()),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
      },
    );
  }
}
