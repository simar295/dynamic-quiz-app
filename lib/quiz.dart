import 'dart:ffi';

import 'package:flutter/material.dart';
import 'data/questiondata.dart';
import 'questionscreen.dart';
import './startscreen.dart';
import './resultscreen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => quizstate();
}

class quizstate extends State<quiz> {
  //Widget? activescreen; //// add question mark after datatype to tell that variable can also be null , no initialization required.
  var activescreen = "start-screen";

  List<String> selectedanswers = []; //for storing selected answers

  /*APPROACH 1
    @override
    void initState() {
    activescreen = startscreen(switchscreen);
    super.initState();
  } */
  void onrestart() {
    setState(() {
      selectedanswers = [];
      activescreen = "start-screen";
    });
  }

  void switchscreen() {
    setState(() {
      /*   activescreen = question(switchback); */
      activescreen = 'question-screen';
    });
  }

  void choosedanswer(String answer) {
    //here we are accepting string answer arg from ouside and adding it to selectedanswers
    selectedanswers.add(answer);

    if (selectedanswers.length == questions.length) {
      setState(() {
        /*   selectedanswers = []; //reseting the quiz */
        activescreen = "result-screen";
        /*  Widget build(context) {
          return questionscreen(choosedanswer);
        } */
      });
    }
  }

  /*  void switchback() {
    setState(() {
      /* activescreen = startscreen(switchscreen); */
      activescreen = 'start-screen';
    });
  } */

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = startscreen(switchscreen);

    if (activescreen == "question-screen") {
      screenwidget = questionscreen(/* switchback, */ choosedanswer);
    }
    if (activescreen == "result-screen") {
      screenwidget = resultscreen(selectedanswers, onrestart);
    }

    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            toolbarHeight: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            centerTitle: true,
            title: const Text("jatt quiz 2.0", textAlign: TextAlign.center),
            backgroundColor: Color.fromARGB(255, 0, 0, 0)),
        body: Container(
          decoration: const BoxDecoration(
            //adding background color
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 221, 9, 62),
              Color.fromARGB(255, 207, 87, 117),
              //Color.fromARGB(255, 199, 199, 199)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: screenwidget,
          /*APPROACH 2
              activescreen == 'start-screen'
              ? startscreen(switchscreen)
              : question(switchback) */
        ),
      ),
    );
  }
}
