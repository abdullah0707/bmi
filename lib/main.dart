import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: const Color.fromARGB(71, 148, 148, 148),
        iconTheme: const IconThemeData(
          color: Colors.white60,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
          ),
          bodyMedium: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
            color: Colors.white54,
          ),
        ),
      ),
      // darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}
