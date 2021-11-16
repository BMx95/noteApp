import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:notes_app/Screens/MainScreen/MainScreen.dart';

TextStyle _introButtonsTextStyle = TextStyle(fontSize: 50, color: Colors.white);
ButtonStyle _introButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    )),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    side: MaterialStateProperty.all<BorderSide>(
        BorderSide(color: Colors.red, width: 5)));

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to BM Notes",
                style: TextStyle(fontSize: 50),
              ),
              OutlinedButton(
                  style: _introButtonStyle,
                  onPressed: () async {
                    await Get.to(Page2(), transition: Transition.leftToRight);
                  },
                  child: Text(
                    "Next",
                    style: _introButtonsTextStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Start Save Your Note with LOVE ♥",
                style: TextStyle(fontSize: 50),
              ),
              OutlinedButton(
                  style: _introButtonStyle,
                  onPressed: () {
                    Get.to(MainScreen(), transition: Transition.upToDown);
                  },
                  child: Text(
                    "Let's Start!",
                    style: _introButtonsTextStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
