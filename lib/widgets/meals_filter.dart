import 'package:flutter/material.dart';

class MealFilter extends StatefulWidget {
  final String title;
  final String description;
  bool currentValue;
  MealFilter({
    Key? key,
    required this.title,
    required this.description,
    required this.currentValue,
  }) : super(key: key);

  @override
  State<MealFilter> createState() => _MealFilterState();
}

class _MealFilterState extends State<MealFilter> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.currentValue,
      onChanged: (newValue) {
        setState(() {
          widget.currentValue = newValue;
        });
      },
      title: Text(widget.title),
      subtitle: Text(widget.description),
    );
  }
}
