import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/pages/micro/NodeDetails.dart';

class MicroPage extends StatelessWidget {
  const MicroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add, color: Colors.white,size: 32,),
        backgroundColor: Color.fromRGBO(0, 100, 53, 1),

        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(100),
      )),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // This sets the color of the leading icon to white
        ),
        title:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("PlantPulse", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),),
            ],
          ),
        ), backgroundColor: Color.fromRGBO(161, 207, 107, 1), actions: [Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(Icons.person, color: Colors.white,),
      )],),

      body:  ListView(
    children: [Stack(
    alignment: Alignment.bottomCenter,
        children: [Container(
          height: 70,
          width: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)),
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color.fromRGBO(161, 207, 107, 1), Color.fromRGBO(74, 173, 82, 1)])
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Ground Sensors", style: GoogleFonts.poppins(
              color: Colors.white,
              height:0.9,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            )),
          )

        ]),


      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: GestureDetector(
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NodeDetails()),
          );},
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(161, 207, 130, 1),
              borderRadius: BorderRadius.circular(20)
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text("Node 1", style: GoogleFonts.poppins(
                        height:1,
                        color: Colors.white,
                        fontWeight: FontWeight.w600, // Different font weight
                        fontSize: 25, // Same font size, or adjust as needed
                      ),),
                      Text("Wheat", style: GoogleFonts.poppins(
                        height:1,
                        color: Colors.white,
                        fontWeight: FontWeight.normal, // Different font weight
                        fontSize: 15, // Same font size, or adjust as needed
                      ),)
                    ],
                  ),

                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(80)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("lib/images/wheat.png"),
                    ),

                  )
                ],
              ),
            ),

          ),
        ),
      )


    ]

      ),
    );
  }
}
