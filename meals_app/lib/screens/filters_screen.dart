import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.saveFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
    _lactoseFree = widget.filters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten' : _glutenFree,
                'lactose' : _lactoseFree,
                'vegan' : _vegan,
                'vegetarian' : _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten Free'),
                  value: _glutenFree,
                  subtitle: Text('Only include Gluten-Free meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  value: _vegan,
                  subtitle: Text('Only include vegan meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  value: _vegetarian,
                  subtitle: Text('Only include vegetarian meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose Free'),
                  value: _lactoseFree,
                  subtitle: Text('Only include Lactose-Free meals.'),
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
