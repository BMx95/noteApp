import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/Screens/MainScreen/MainScreen.dart';

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
              Text("Welcome to BM Notes"),
              TextButton(
                  onPressed: () async {
                    await Get.to(Page2(), transition: Transition.leftToRight);
                  },
                  child: Text("Next"))
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
              Text("Start Save Your Note with LOVE ♥"),
              TextButton(
                  onPressed: () {
                    Get.to(MainScreen(), transition: Transition.leftToRight);
                  },
                  child: Text("Let's Start!"))
            ],
          ),
        ),
      ),
    );
  }
}
