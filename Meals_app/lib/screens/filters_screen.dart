import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  Function updateFilter;
  Map filters;

  FiltersScreen(this.updateFilter, this.filters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState(
      glutenFree: filters['gluten'],
      vegetarian: filters['vegetarian'],
      lactoseFree: filters['lactose'],
      vegan: filters['vegan']);
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree;
  bool vegetarian;
  bool lactoseFree;
  bool vegan;

  _FiltersScreenState(
      {this.glutenFree = false,
      this.vegetarian = false,
      this.lactoseFree = false,
      this.vegan = false});

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) update) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchListTile(
                'Gluten-free',
                'Only include gluten-free meals.',
                glutenFree,
                (value) {
                  setState(() {
                    glutenFree = value;
                    widget.updateFilter('gluten', glutenFree);
                  });
                },
              ),
              _buildSwitchListTile(
                'Lactose-free',
                'Only include lactose-free meals.',
                lactoseFree,
                (value) {
                  setState(() {
                    lactoseFree = value;
                    widget.updateFilter('lactose', lactoseFree);
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegetarian',
                'Only include vegetarian meals.',
                vegetarian,
                (value) {
                  setState(() {
                    vegetarian = value;
                    widget.updateFilter('vegetarian', vegetarian);
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only include vegan meals.',
                vegan,
                (value) {
                  setState(() {
                    vegan = value;
                    widget.updateFilter('vegan', vegan);
                  });
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
