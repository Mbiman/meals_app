import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../widgets/meals_filter.dart';

class SettingsScreen extends StatefulWidget {
  static const namedRoute = 'settings-screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final bool _glutenFree = false;
  final bool _vegan = false;
  final bool _vegetarian = false;
  final bool _lactoseFree = false;
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
                ),
                MealFilter(
                  currentValue: _vegan,
                  description: 'Only include Vegan meals',
                  title: 'Vegan',
                ),
                MealFilter(
                  currentValue: _lactoseFree,
                  description: 'Only include Lactose-free meals',
                  title: 'Lactose',
                ),
                MealFilter(
                  currentValue: _vegetarian,
                  description: 'Only include Vegeterian meals',
                  title: 'Vegeterian',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
