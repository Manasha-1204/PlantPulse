import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(
        title:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Plant Pulse", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),),
        ), backgroundColor: Colors.transparent, actions: [Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(Icons.person, color: Colors.white,),
      )],),
      body: Expanded(
        child: Column(
          children: [Stack(
            alignment: Alignment.bottomLeft,
            children: [Container(
                height: 250,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(81)),
                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color.fromRGBO(161, 207, 107, 1), Color.fromRGBO(74, 173, 82, 1)])
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [Text.rich(TextSpan(
                    text: 'Welcome \n', // First part of the text
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      height:0.9,
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                    ),
                    children: <TextSpan>[
                    TextSpan(
                      text: 'Username!', // Second part of the text
                      style: GoogleFonts.poppins(
                        height:0.8,
                        color: Colors.white,
                        fontWeight: FontWeight.w600, // Different font weight
                        fontSize: 35, // Same font size, or adjust as needed
                      ),
                    ),
        
        
                    ],
                  )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Flex(
                        direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(Icons.location_pin, color: Colors.white,),
                        Text("Coimbatore, India", style: GoogleFonts.poppins(color: Colors.white),)
                      ],
                                    ),
                    )]
                ),
        
        
              )
        
            ]
          )],
        ),
      ),



    );
  }
}
