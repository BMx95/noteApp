import 'package:flutter/material.dart';
import 'package:notes_app/Controllers/NotesControllers.dart';
import 'package:notes_app/Screens/MainScreen/MainScreen.dart';

class EditNoteDialog extends StatefulWidget {
  final String text, title, id;

  EditNoteDialog(
      {Key? key, required this.text, required this.title, required this.id})
      : super(key: key);

  @override
  _EditNoteDialogState createState() =>
      _EditNoteDialogState(title: title, text: text, id: id);
}

class _EditNoteDialogState extends State<EditNoteDialog>
    with SingleTickerProviderStateMixin {
  _EditNoteDialogState(
      {required this.title, required this.text, required this.id});
  late String title, text, id;

  late AnimationController animationController;
  late TextEditingController titleCtrl = new TextEditingController();
  late TextEditingController textCtrl = new TextEditingController();
  @override
  void initState() {
    titleCtrl.text = title;
    textCtrl.text = text;
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
          title: Row(
            children: [
              Text("Edit Note"),
              SizedBox(
                width: MediaQuery.of(context).size.width * .35,
              ),
              IconButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return AlertDialog(
                            title: Text("Alert!"),
                            content: Text(
                                "Are you sure you want to delete this note?"),
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    await NoteCtrl.deleteNote(id);

                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (builder) {
                                      return MainScreen();
                                    }), (route) => false);
                                  },
                                  child: Text("Yes")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("No"))
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
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
                NoteCtrl.editNote({
                  "Text": textCtrl.text,
                  "Date": DateTime.now().toString(),
                  "Title": titleCtrl.text,
                  "id": id,
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
