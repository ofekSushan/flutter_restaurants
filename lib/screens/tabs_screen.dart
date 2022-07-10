import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import './categories_screen.dart';
import '../widgets/main_Drawer.dart';
class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pages = [
    {"page": const CategoriesScreen(), "title": "Categories"},
    {"page": const FavoritesScreen(), "title": "Favorites"},
  ];
  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        _pages[selectedPageIndex]["title"],
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );

    return Scaffold(
      appBar: appbar,
      drawer: mainDrawer(),
      body: _pages[selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColorLight,
        selectedItemColor: Theme.of(context).colorScheme.onBackground,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            label: ('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            label: ('Favorites'),
          )
        ],
      ),
    );
  }
}
