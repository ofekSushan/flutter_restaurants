import 'package:flutter/material.dart';
import 'package:navigation_app/models/meal.dart';
import './screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './dummy_data.dart';

void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    "gluten": false,
    "vegetarian": false,
    "vegan": false,
    "lactose": false
  };

  List <Meal> favorites=[];
  List<Meal> availablemeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availablemeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final favoriteindex = favorites.indexWhere((meal) => meal.id == mealId);
    if (favoriteindex >= 0) {
      setState(() {
        favorites.removeAt(favoriteindex);
      });
    }
     if (favoriteindex <= -1) {
      setState(() {
        favorites.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
  }
  }

  bool isMealFavorite(String id){
    return favorites.any((meal) => meal.id==id);

  }

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
        '/': ((ctx) => TabScreen(favorites)),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availablemeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(toggleFavorite,isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              saveFilters: _setFilters,
              currentFilters: filters,
            ),
      },
      // אם לא נמצא ב routes
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: ((context) => CategoryMealsScreen()));
      // },
      // // אם העמוד לא מצא שום עמוד
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: ((context) => CategoryMealsScreen()));
      // },
    );
  }
}
