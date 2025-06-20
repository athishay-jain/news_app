import 'package:flutter/material.dart';
import 'package:news_app/UI/Screens/Splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:Color(0xff1A73E8)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
