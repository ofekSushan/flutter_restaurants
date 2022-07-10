import '../screens/filters_screen.dart';
import 'package:flutter/material.dart';

class mainDrawer extends StatelessWidget {
  Widget buildListtTile(String title, IconData icon, VoidCallback  taphandler) {
    return ListTile(
      onTap: taphandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
          child: Text(
            "Cooking Up",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: "Raleway",
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        buildListtTile("Meals", Icons.restaurant_menu, () {
          Navigator.of(context).pushNamed("/");
        }),
        buildListtTile("settings", Icons.settings_applications_sharp, () {
          Navigator.of(context).pushNamed(FiltersScreen.routeName);
        })
      ]),
    );
  }
}
