import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class startscreen extends StatelessWidget {
  final VoidCallback handler;
  startscreen(this.handler);

  @override
  Widget build(context) {
    return Center(
      //adding background colors
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize:
            MainAxisSize.min, //for centering images // take the minimun height
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 30, 0), //align images

            child: // Opacity( //adding opacity forcefully to images
                //opacity: 0.6,
                Image.asset('assets/legend.png'
                    //   color: Colors.white,
                    ),
          ),
          //  ), //width: 300 // adding images

          Text(
            "LEGENDS NEVER DIE RIP !",
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
          SizedBox(height: 0),

          FloatingActionButton.extended(
            onPressed: () {
              handler(); // 2 HOUR WASTED ALWAYS USE () BRACKETS WHEN EXECUTING FUNCTIONS
            },
            label: Text(
              "start quiz",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.agriculture,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
