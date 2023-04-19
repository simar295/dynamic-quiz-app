import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class questionsummary extends StatelessWidget {
  final List<Map<String, Object>> summarydata;
  questionsummary(this.summarydata);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            return Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: /* 'user-answer' == 'correct-answer'? */
                          Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    ((data["question-index"] as int) + 1).toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 25)),
                      Text(
                        data["question"] as String,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Your answer:  ${data["user-answer"] as String}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromARGB(255, 2, 207, 243),
                        ),
                      ),
                      Text(
                        'Correct answer:  ${data["correct-answer"] as String}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Color.fromARGB(255, 5, 233, 55),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
