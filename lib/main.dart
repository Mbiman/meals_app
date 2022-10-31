import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/settings_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: FlexThemeData.light(
        scheme: FlexScheme.mandyRed,
        fontFamily: GoogleFonts.aBeeZee().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => const TabsScreen(),
        CategoryMealsScreen.namedRoute: (context) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.namedRoute: (context) => const MealDetailScreen(),
        SettingsScreen.namedRoute: (context) => SettingsScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },
    );
  }
}
