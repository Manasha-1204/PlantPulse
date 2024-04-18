import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonsHome extends StatelessWidget {
  final String heading;
  final String imgpath;
  const ButtonsHome({super.key, required this.heading, required this.imgpath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white, boxShadow: [new BoxShadow(
        color: Colors.grey.shade300,
        blurRadius: 30,
      ),]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width:350, height:180,clipBehavior: Clip.antiAlias,
                  child: Image.asset(imgpath, fit: BoxFit.cover, )),
            ),
            Text(heading, style: GoogleFonts.poppins())

          ],


        ),
      ),
    );
  }
}
