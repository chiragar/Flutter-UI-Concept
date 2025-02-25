import 'package:flutter/material.dart';
import 'package:flutterui/main_screen.dart';
import 'package:flutterui/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ui',
      debugShowCheckedModeBanner: false,

      scaffoldMessengerKey: scaffoldMessengerKey, // Global Key
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
