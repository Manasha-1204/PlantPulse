import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/pages/user/userlogin.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Row(
              children: [
                Container(
                  child: Image.asset("lib/images/icon.jpg"),
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 10), // Add some space between the image and text
                Expanded( // This ensures the Column with text takes the remaining space
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PlantPulse",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          height: 0.9,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        "Precision Agriculture for the Future!",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          height:0.9,
                          fontSize: 22,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserLogin()),
                );
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Color.fromRGBO(90, 147, 66, 1)),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Started",
                        style: GoogleFonts.poppins(

                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          height:0.9,
                          fontSize: 25,
                        ),
                      ),
                      Icon(Icons.navigate_next, color: Colors.white, size: 50,)
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
