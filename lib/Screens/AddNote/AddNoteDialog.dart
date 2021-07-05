import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/Controllers/NotesControllers.dart';
import 'package:notes_app/Screens/MainScreen/MainScreen.dart';
import 'package:notes_app/main.dart';

class AddNoteDialog extends StatefulWidget {
  AddNoteDialog({Key? key}) : super(key: key);

  @override
  _AddNoteDialogState createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  TextEditingController titleCtrl = new TextEditingController();
  TextEditingController textCtrl = new TextEditingController();
  @override
  void initState() {
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (builder, child) {
        return Transform.scale(
          scale: animationController.value,
          child: child,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "write note title here"),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: textCtrl,
                  maxLines: 20,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "write your note here"),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                NoteCtrl.saveNote({
                  "Text": textCtrl.text,
                  "Date": DateTime.now().toString(),
                  "Title": titleCtrl.text,
                });
               
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (builder) {
                  return MainScreen();
                }), (route) => false);
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
