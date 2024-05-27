
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantapp/pages/home/home.dart';
import 'package:plantapp/pages/start.dart';
import 'package:plantapp/userdets.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserInfo(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartPage(),
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
      ),
    );
  }
}
