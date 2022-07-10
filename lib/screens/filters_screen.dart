import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static  const routeName="/filters";
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        "Filters",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
    return Scaffold(
      appBar:appbar ,
      body: Center(child: Text("Filters!")),
    );
  }
}
