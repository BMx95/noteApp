import 'package:flutter/material.dart';
import 'package:notes_app/Screens/AddNote/AddNoteDialog.dart';

class AppBarWidget extends StatefulWidget {
  AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget>
    with SingleTickerProviderStateMixin {
  TextEditingController titleCtrl = new TextEditingController();
  TextEditingController textCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Notes'),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (builder) {
                  return AddNoteDialog();
                },
                barrierDismissible: true,
                useSafeArea: true,
                //barrierColor: Colors.transparent,
              );
            },
            icon: Icon(Icons.add))
      ],
    );
  }
}
