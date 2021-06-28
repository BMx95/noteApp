import 'package:flutter/material.dart';
import 'package:notes_app/Screens/ComponentsWidgets/NoteCard.dart';
import 'package:notes_app/Screens/ComponentsWidgets/drawer.dart';

import '../notes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /* var notes = {
    "Note1": {
      "Title": "Note 1",
      "Text": "This is note 1",
      "Date": DateTime.now().toString(),
    },
    "Note2": {
      "Title": "Note 2",
      "Text": "This is note 2",
      "Date": DateTime.now().toString(),
    },
    "Note3": {
      "Title": "Note 3",
      "Text": "This is note 3",
      "Date": DateTime.now().toString(),
    },
    "Note4": {
      "Title": "Note 4",
      "Text": "This is note 4",
      "Date": DateTime.now().toString(),
    }
  };*/
  TextEditingController titleCtrl = new TextEditingController();
  TextEditingController textCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: SimpleDialog(
                          title: Text("Add Note"),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: titleCtrl,
                                  decoration: InputDecoration(
                                      hintText: "Enter Note Title"),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: textCtrl,
                              maxLines: 20,
                              decoration: InputDecoration(
                                  hintText: "write your note here"),
                            ),
                            TextButton(
                                onPressed: () {
                                  var data = {
                                    titleCtrl.text: {
                                      "Title": titleCtrl.text,
                                      "Text": textCtrl.text,
                                      "Date": DateTime.now().toString(),
                                    }
                                  };
                                  notes.addAll(data);

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (builder) {
                                    return MainScreen();
                                  }));
                                },
                                child: Text("Save"))
                          ],
                        ),
                      );
                    });
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: DrawerWidget(),
      body: GridView.count(
        crossAxisCount: 2,
        children: notes.entries.map((e) {
          return NoteCard(
            date: e.value['Date'].toString(),
            text: e.value['Text'].toString(),
            title: e.value['Title'].toString(),
          );
        }).toList(),
      ),
    );
  }
}
