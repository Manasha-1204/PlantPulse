import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../userdets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = Provider.of<UserInfo>(context, listen: false).name;
    String location = Provider.of<UserInfo>(context, listen: false).location;
    String crop = Provider.of<UserInfo>(context, listen: false).crop;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // This sets the color of the leading icon to white
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
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(161, 207, 107, 1),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to the profile page (optional)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 70,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(161, 207, 107, 1),
                      Color.fromRGBO(74, 173, 82, 1),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "User Profile",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        height: 0.9,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircleAvatar(
              radius: 60, // Adjust size as needed
              backgroundColor: Colors.grey[300], // Default profile picture color
              child: Icon(
                Icons.person,
                size: 100, // Adjust size as needed
                color: Colors.grey[600], // Default profile picture icon color
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Name"),
            subtitle: Text(username ?? ""), // Display name from UserInfo
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("Location"),
            subtitle: Text(location ?? ""), // Display location from UserInfo
          ),
          ListTile(
            leading: Icon(Icons.agriculture),
            title: Text("Crop"),
            subtitle: Text(crop ?? ""), // Display crop from UserInfo
          ),
        ],
      ),
    );
  }
}
