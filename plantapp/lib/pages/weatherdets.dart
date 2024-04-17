import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherDetails extends StatelessWidget {
  final String wtype;
  final String val;
  final IconData ic;

  const WeatherDetails({super.key, required this.wtype, required this.val,
  required this.ic});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(ic, size: 40, color: Colors.white,),
            ),
            decoration: BoxDecoration(color: Color.fromRGBO(143, 207, 130, 1),
                borderRadius: BorderRadius.circular(10),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              direction: Axis.vertical,
              children: [Text.rich(TextSpan(
              text:  '$wtype\n', // First part of the text
              style: GoogleFonts.poppins(
                color: Colors.black,
                height:1,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                ),
                children: <TextSpan>[
                TextSpan(
                text: val, // Second part of the text
                style: GoogleFonts.poppins(
                height:1,
                color: Colors.black,
                fontWeight: FontWeight.w600, // Different font weight
                fontSize: 25, // Same font size, or adjust as needed
                ),
                ),


                ],
                )),
                      ]),
          )

        ],
      ),
    );
  }
}
