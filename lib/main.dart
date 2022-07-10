import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';


void main() => runApp(MyApp());

appbarcrate(String text) {
  AppBar(
    title: Text(text),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
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
        '/': ((ctx) => TabScreen()),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName:(ctx) => FiltersScreen(),
      },
      // אם לא נמצא ב routes
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: ((context) => CategoryMealsScreen()));
      },
      // אם העמוד לא מצא שום עמוד 
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: ((context) => CategoryMealsScreen()));
      },
    );
  }
}
