import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jatt_quiz_2/data/questiondata.dart';
import 'package:jatt_quiz_2/models/questionclass.dart';
import 'package:jatt_quiz_2/startscreen.dart';
import './questionsummary.dart';
import 'quiz.dart';

class resultscreen extends StatelessWidget {
  final List<String> choosenanswers;
  final VoidCallback onrestart;
  resultscreen(this.choosenanswers, this.onrestart);

  List<Map<String, Object>> getsummarydata() {
    //important
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenanswers.length; i++) {
      summary.add(
        {
          'question-index': i,
          'question': questions[i].text,
          'correct-answer': questions[i].answers[0],
          'user-answer': choosenanswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getsummarydata();
    final totalquestion = questions.length;

    var correctquestions = summarydata.where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'you answer $correctquestions out of $totalquestion questions correctly!',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          questionsummary(summarydata),
          SizedBox(
            height: 30,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              onrestart();
            },
            label: Text("restart quiz"),
            icon: Icon(Icons.refresh),
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
