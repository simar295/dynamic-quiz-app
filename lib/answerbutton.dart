import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class answerbutton extends StatelessWidget {
  answerbutton(this.answertext, this.ontap);

  final String answertext;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 74, 247, 146),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          // Padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          onPressed: () {
            ontap();
            print("pressed");
          },
          child: Text(answertext,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          // backgroundColor: Color.fromARGB(255, 71, 3, 14),
          /* icon: Icon(Icons.agriculture), */
        ),
      ],
    );
  }
}
