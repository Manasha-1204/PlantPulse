import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../user/profile.dart';

class MacroPage extends StatelessWidget {
  const MacroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: Icon(Icons.person, color: Colors.white,)
      ),
    ),]),
      body: ListView(
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
            child: Text("Satellite View", style: GoogleFonts.poppins(
              color: Colors.white,
              height:0.9,
              fontWeight: FontWeight.w600,
              fontSize: 28,
            )),
          )
        
        ])])
    );
  }
}
