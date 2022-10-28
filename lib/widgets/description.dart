import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final IconData cardIcon;
  final String text;
  const Description({
    Key? key,
    required this.cardIcon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(cardIcon),
        const SizedBox(height: 6),
        Text(text),
      ],
    );
  }
}
