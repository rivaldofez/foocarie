import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foocarie/constants.dart';
import 'package:foocarie/screens/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demos',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          fontFamily: "Hellix",
        ),
        home: const HomeScreen());
  }
}
