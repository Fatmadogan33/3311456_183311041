import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:firebase_core/firebase_core.dart'; 
import 'giris.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCS2o_c0KeYJbjKAMoEILohr4CLzdcCfQI", // Your apiKey
      appId: "781120738062", // Your appId
      messagingSenderId: "XXX", // Your messagingSenderId
      projectId: "flutter-application-1-43a3a", // Your projectId
    ),
  );
  
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ankara Şehir Hastanesi",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Giris(),
    );
  }
}
