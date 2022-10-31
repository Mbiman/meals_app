import 'package:flutter/material.dart';

class MealFilter extends StatefulWidget {
  final String title;
  final String description;
  final Function(bool) onChanged;
  bool currentValue;
  MealFilter({
    Key? key,
    required this.title,
    required this.description,
    required this.currentValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<MealFilter> createState() => _MealFilterState();
}

class _MealFilterState extends State<MealFilter> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.currentValue,
      onChanged: widget.onChanged,
      title: Text(widget.title),
      subtitle: Text(widget.description),
    );
  }
}
