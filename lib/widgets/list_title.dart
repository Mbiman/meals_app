import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTitle extends StatelessWidget {
  final String header;
  const ListTitle({
    Key? key,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        header,
        style: GoogleFonts.openSans(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
