import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp/pages/micro/sensordets.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

class NodeDetails extends StatefulWidget {
  const NodeDetails({super.key});

  @override
  State<NodeDetails> createState() => _NodeDetailsState();
}

class _NodeDetailsState extends State<NodeDetails> {
  List result = [];
  int sensedtemp = 35;
  int sensedhumidity = 60;
  double sensedrainfall = 100;

  String predicted = "";
  final List<String> labels = ['rice', 'maize', 'chickpea', 'kidneybeans', 'pigeonpeas',
    'mothbeans', 'mungbean', 'blackgram', 'lentil', 'pomegranate', 'banana', 'mango',
    'grapes', 'watermelon', 'muskmelon', 'apple', 'orange', 'papaya',
    'coconut', 'cotton', 'jute', 'coffee'];

  runModel(temp, humd, rain) async {
    final interpreter = await tfl.Interpreter.fromAsset('lib/mlmodel/linearRegrssionModel.tflite');
    //prepare input as required by your model
    //in my case it required a single number and i am requiring it from user
    //passing user entered number to model as input
    final input = [
      [temp, humd, rain]
    ];
    //Prepare output set and use reshape method from the plugin.
    //Input and output preparing guide comes with the model documentation.
    var output = List.filled(22, 0).reshape([1, 22]);
    //run the interpreter on prepared input and output.
    interpreter.run(input, output);
    //model process the input and updates the output
    //Result variable to show output to user
    result = output[0];
    print(result);

    int maxIndex = 0;
    double maxValue = result[0];
    for (int i = 1; i < result.length; i++) {
      if (result[i] > maxValue) {
        maxIndex = i;
        maxValue = result[i];
      }
    }

    setState(() {
      predicted = labels[maxIndex];
      print(predicted);
    });
  }

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
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(161, 207, 107, 1),
                        Color.fromRGBO(74, 173, 82, 1)
                      ])),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SensorDetails(
                      sensedval: "$sensedtemp°C",
                      icon: Icons.thermostat,
                      stype: "Temperature",
                    ),
                    SensorDetails(
                      sensedval: "$sensedhumidity%",
                      icon: Icons.water_drop,
                      stype: "Humidity",
                    ),

                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            // TO DO: Add model feature here
              onPressed: () {
                runModel(sensedtemp, sensedhumidity, sensedrainfall);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Color.fromRGBO(74, 173, 82, 1),
              ),
              child: Text(
                "Get Crop Recommendation",
                style: GoogleFonts.poppins(
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.normal, // Different font weight
                  fontSize: 17, // Same font size, or adjust as needed
                ),
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
