import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/pages/home/home.dart';
import 'package:provider/provider.dart';
import '../../userdets.dart';

class UserLogin extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController cropController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: cropController,
              decoration: InputDecoration(labelText: 'Crop'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.read<UserInfo>().setName(nameController.text);
                context.read<UserInfo>().setLocation(locationController.text);
                context.read<UserInfo>().setCrop(cropController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );;
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromRGBO(161, 207, 107, 1),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
