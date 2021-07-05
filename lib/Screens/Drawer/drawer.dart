import 'package:flutter/material.dart';
import 'package:notes_app/Themes/ThemeManager.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: CustomTheme.currentTheme == ThemeMode.dark
                ? Icon(Icons.dark_mode)
                : Icon(Icons.light_mode),
            title: TextButton(
              child: Text("Change theme"),
              onPressed: () {
                currentTheme.toggleTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
