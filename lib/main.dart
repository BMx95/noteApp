import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/Screens/MainScreen.dart';
import 'package:notes_app/Themes/MainTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

String key = 'count';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    currentTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      theme: CustomTheme.mainTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: CustomTheme.currentTheme,
    );
  }
}
