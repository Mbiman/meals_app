import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../widgets/meals_filter.dart';

class SettingsScreen extends StatefulWidget {
  static const namedRoute = 'settings-screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const SettingsScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selections',
              style: GoogleFonts.ubuntu(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                MealFilter(
                  currentValue: _glutenFree,
                  description: 'Only include gluten-free meals',
                  title: 'Gluten-free',
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                MealFilter(
                  currentValue: _vegan,
                  description: 'Only include Vegan meals',
                  title: 'Vegan',
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                MealFilter(
                  currentValue: _lactoseFree,
                  description: 'Only include Lactose-free meals',
                  title: 'Lactose',
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                MealFilter(
                  currentValue: _vegetarian,
                  description: 'Only include Vegeterian meals',
                  title: 'Vegeterian',
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
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
