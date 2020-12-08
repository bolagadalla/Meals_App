import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String screenRouteName = "/filter-screen";

  final Map<String, bool> filters;
  final Function saveFilters;

  FilterScreen(this.filters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters["gluten"];
    _vegetarian = widget.filters["vegetarian"];
    _isVegan = widget.filters["vegan"];
    _isLactoseFree = widget.filters["lactose"];
    super.initState();
  }

  Widget _filterSwitch(
    String title,
    String subtitle,
    bool switchValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      value: switchValue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                "gluten": _glutenFree,
                "lactose": _isLactoseFree,
                "vegan": _isVegan,
                "vegetarian": _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Filter Meals",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _filterSwitch(
                  "Gluten Free",
                  "Only include Gluten Free meals",
                  _glutenFree,
                  (val) {
                    setState(
                      () {
                        _glutenFree = val;
                      },
                    );
                  },
                ),
                _filterSwitch(
                  "Vegetarian",
                  "Only include Vegetarian meals",
                  _vegetarian,
                  (val) {
                    setState(
                      () {
                        _vegetarian = val;
                      },
                    );
                  },
                ),
                _filterSwitch(
                  "Vegen",
                  "Only include Vegen meals",
                  _isVegan,
                  (val) {
                    setState(
                      () {
                        _isVegan = val;
                      },
                    );
                  },
                ),
                _filterSwitch(
                  "Lactose Free",
                  "Only include Lactose Free meals",
                  _isLactoseFree,
                  (val) {
                    setState(
                      () {
                        _isLactoseFree = val;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
