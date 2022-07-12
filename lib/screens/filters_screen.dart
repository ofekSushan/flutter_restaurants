import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../widgets/main_Drawer.dart';

typedef BoolToVoid = void Function(bool);
typedef MapOfStringBool = Function(Map<String, bool>);

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen({required this.saveFilters, required this.currentFilters});
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenfree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;

  @override
  void initState() {
    glutenfree = widget.currentFilters['gluten'] ?? false;
    vegetarian = widget.currentFilters["vegetarian"] ?? false;
    vegan = widget.currentFilters["vegan"] ?? false;
    lactoseFree = widget.currentFilters["lactoseFree"] ?? false;

    super.initState();
  }

  Widget buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    BoolToVoid newValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: newValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        "Filters",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      actions: [
        IconButton(
            onPressed: () {
              final selectedfilters = {
                "gluten": glutenfree,
                "vegetarian": vegetarian,
                "vegan": vegan,
                "lactose": lactoseFree
              };
              widget.saveFilters(selectedfilters);
            },
            icon: const Icon(Icons.save_as))
      ],
    );
    return Scaffold(
        appBar: appbar,
        drawer: mainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                    "Gluten-free",
                    "only include Gluten-free meals",
                    glutenfree,
                    (newValue) {
                      setState(
                        () {
                          glutenfree = newValue;
                        },
                      );
                    },
                  ),
                  buildSwitchListTile(
                    "vegetarian",
                    "only include vegetarian meals",
                    vegetarian,
                    (newValue) {
                      setState(
                        () {
                          vegetarian = newValue;
                        },
                      );
                    },
                  ),
                  buildSwitchListTile(
                    "vegan",
                    "only include vegan meals",
                    vegan,
                    (newValue) {
                      setState(
                        () {
                          vegan = newValue;
                        },
                      );
                    },
                  ),
                  buildSwitchListTile(
                    "lactose free",
                    "only include lactose-free meals",
                    lactoseFree,
                    (newValue) {
                      setState(
                        () {
                          lactoseFree = newValue;
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
