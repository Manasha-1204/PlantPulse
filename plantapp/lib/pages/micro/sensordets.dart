import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SensorDetails extends StatelessWidget {
  final String sensedval;
  final String stype;
  final IconData icon;
  const SensorDetails({super.key, required this.sensedval, required this.icon, required this.stype});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(icon, size: 50, color: Colors.white,),
          ),
          decoration: BoxDecoration(
          ),
        ),
        Wrap(
            direction: Axis.vertical,
            children: [Text.rich(TextSpan(
              text:  '$stype\n', // First part of the text
              style: GoogleFonts.poppins(
                color: Colors.white,
                height:1,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: sensedval, // Second part of the text
                  style: GoogleFonts.poppins(
                    height:1,
                    color: Colors.white,
                    fontWeight: FontWeight.w600, // Different font weight
                    fontSize: 25, // Same font size, or adjust as needed
                  ),
                ),


              ],
            )),
            ])

      ],
    );

  }
}


class IrrigationContainer extends StatelessWidget {
  const IrrigationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.flash_off_rounded, size: 60, )),
          Wrap(
            children: [
              Icon(Icons.energy_savings_leaf_sharp),
              Text("Turn Motor Off ", style: GoogleFonts.poppins(
                height:1,
                color: Colors.black,
                fontWeight: FontWeight.w600, // Different font weight
                fontSize: 25, // Same font size, or adjust as needed
              ),),
            ],
          )
        ],
      ),
    );
  }
}
