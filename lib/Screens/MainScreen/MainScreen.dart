import 'package:flutter/material.dart';
import 'package:notes_app/Screens/MainScreen/components/AppBar.dart';
import 'package:notes_app/Screens/MainScreen/components/NoteCard.dart';
import 'package:notes_app/Screens/Drawer/drawer.dart';

import '../../notes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: AppBarWidget()),
      drawer: DrawerWidget(),
      body: notes.length < 1
          ? Center(
              child: Text(
                "No Notes",
                style: TextStyle(fontSize: 25),
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: notes.map((note) {
                return NoteCard(
                  date: note['Date'].toString(),
                  text: note['Text'].toString(),
                  title: note['Title'].toString(),
                  id:note['id'],
                );
              }).toList(),
            ),
    );
  }
}
