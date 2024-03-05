import 'package:flutter/material.dart';
import 'package:flutter_engineering_example/stream_logic.dart';
import 'package:flutter_engineering_example/stream_example.dart';

void main() {
  // Call the static function to intialize the StreamLogic
  StreamLogic.initialize();

  // Run the application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  // Normal widget constructor taking a single optional argument (key)
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Return a MaterialApp
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Create our stream 
      home: const StreamExample(),
    );
  }
}
