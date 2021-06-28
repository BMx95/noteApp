import 'dart:convert';

import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  NoteCard(
      {Key? key, required this.date, required this.text, required this.title})
      : super(key: key);
  String title, date, text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)),
        child: GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (buidler) {
                  return SimpleDialog(
                    title: Text(title),
                    children: [
                      Text(date),
                      TextFormField(
                        initialValue: text,
                      ),
                    ],
                  );
                });
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Text(title, style: TextStyle(fontSize: 30)),
                Text(date.substring(0, 10), style: TextStyle(fontSize: 30)),
                Text(text.length < 10 ? text : text.substring(0, 10) + "....",
                    style: TextStyle(fontSize: 15)),
              ],
            ),
            color: Colors.brown,
          ),
        ),
      ),
    );
  }
}
