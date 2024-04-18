import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/pages/micro/sensordets.dart';

class NodeDetails extends StatelessWidget {
  const NodeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color:
              Colors.white, // This sets the color of the leading icon to white
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "PlantPulse",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(161, 207, 107, 1),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Node 1 Details",
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25),
          )),
          Image.asset("lib/images/wheat.png"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(161, 207, 107, 1),
                        Color.fromRGBO(74, 173, 82, 1)
                      ])),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SensorDetails(
                      sensedval: "25°C",
                      icon: Icons.thermostat,
                      stype: "Temperature",
                    ),
                    SensorDetails(
                      sensedval: "60%",
                      icon: Icons.water_drop,
                      stype: "Soil Moisture",
                    )
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Get Crop Recommendation",
                style: GoogleFonts.poppins(
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.normal, // Different font weight
                  fontSize: 17, // Same font size, or adjust as needed
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Color.fromRGBO(74, 173, 82, 1),
              )),
          SizedBox(height: 30),
          Column(
            children: [
              Text(
                "Irrigation Control",
                style: GoogleFonts.poppins(
                  height: 1,
                  color: Colors.black,
                  fontWeight: FontWeight.w600, // Different font weight
                  fontSize: 20, // Same font size, or adjust as needed
                ),
              ),

              // IrrigationContainer()
            ],


          )
        ],
      ),
    );
  }
}
