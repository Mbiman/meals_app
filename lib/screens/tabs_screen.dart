import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favouites_screen.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  const TabsScreen({Key? key, required this.favouriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;

  @override
  void initState() {
    _pages = [
      const CategoriesScreen(),
      FavouritesScreen(
        favouriteMeals: widget.favouriteMeals,
      ),
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Supa Pac',
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).bottomAppBarTheme.color,
            icon: const Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).bottomAppBarTheme.color,
            icon: const Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).bottomAppBarTheme.color,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
