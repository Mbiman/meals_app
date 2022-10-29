import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile({required String title, required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      width: width * 0.65,
      child: Column(
        children: [
          Container(
            height: height * 0.15,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Text(
              'MENU',
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildListTile(title: 'Meals', icon: Icons.restaurant),
          buildListTile(title: 'Settings', icon: Icons.settings),
        ],
      ),
    );
  }
}
