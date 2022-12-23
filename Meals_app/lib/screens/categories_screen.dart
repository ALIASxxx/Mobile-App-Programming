import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      appBar: AppBar(title: Text('Meals',),),
      body: */GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (cat) => CategoryItem(
                cat.id,
                cat.title,
                cat.color,
              ),
            )
            .toList(),
      )//,
    /*)*/;
  }
}
