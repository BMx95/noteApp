import 'package:flutter/material.dart';
import 'package:notes_app/Controllers/NotesControllers.dart';
import 'package:notes_app/Screens/IntroScreen/IntroScreen.dart';
import 'package:notes_app/Screens/MainScreen/MainScreen.dart';
import 'package:notes_app/Themes/ThemeManager.dart';
import 'package:get/get.dart';

import 'globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteCtrl.getNotes();
  await NoteCtrl.newUser();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    currentTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = null;
    return GetMaterialApp(
      getPages: [],
      home: user == null ? Page1() : MainScreen(),
      theme: CustomTheme.mainTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: CustomTheme.currentTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
