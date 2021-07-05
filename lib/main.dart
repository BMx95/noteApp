import 'package:flutter/material.dart';
import 'package:notes_app/Controllers/NotesControllers.dart';
import 'package:notes_app/Screens/MainScreen/MainScreen.dart';
import 'package:notes_app/Themes/ThemeManager.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteCtrl.getNotes();
  /*var localNotes = await NoteCtrl.db.get();
  notes = localNotes!.values.toList();*/
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
    return GetMaterialApp(
      home: MainScreen(),
      theme: CustomTheme.mainTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: CustomTheme.currentTheme,
    );
  }
}
