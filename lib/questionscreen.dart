import 'package:flutter/material.dart';
import 'package:jatt_quiz_2/answerbutton.dart';
import 'package:jatt_quiz_2/data/questiondata.dart';
import 'answerbutton.dart';
import 'package:google_fonts/google_fonts.dart';

class questionscreen extends StatefulWidget {
  /*  final VoidCallback back; */
  final void Function(String answer) choosefunc;
  questionscreen(/* this.back, */ this.choosefunc);

  @override
  State<StatefulWidget> createState() => questionscreenstate();
}

@override
class questionscreenstate extends State<questionscreen> {
/*     final VoidCallback back;
  questionscreenstate(this.back);
 */
  var questionindex = 0;
  void nextquestion(String selectedanswer) {
    widget.choosefunc(selectedanswer);

    setState(() {
      questionindex += 1;
    });
  }

  Widget build(BuildContext context) {
    final currentquestion = questions[questionindex];

    return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60),
            ...currentquestion.getshuffledanswers().map((values) {
              return answerbutton(values, () {
                nextquestion(values);
              });
            })
            /* answerbutton(currentquestion.answers[0], () {}),
            SizedBox(height: 20),
            answerbutton("answertext", () {}),
            SizedBox(height: 20),
            answerbutton("answertext", () {}), */

            ,
            /* Container(
              height: 250,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    /*  back(); */
                  },
                  label: Text("return back"),
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  icon: Icon(Icons.agriculture),
                ),
              ),
            ), */
          ],
        ),
      ),
      /* decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 15)), */
    );
  }
}
