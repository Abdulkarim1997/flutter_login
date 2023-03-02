import 'package:flutter/material.dart';

import 'color/color.dart';
import 'login_scrren.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myMaterialColor,
        iconTheme: IconThemeData(color: myMaterialColor),
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: myMaterialColor,
            brightness: Brightness.light,
            backgroundColor: blueGreyColor,
            errorColor: redColor,
            accentColor: greenColor),
      ),
      title: "Flutter Demo",
      home: LoginScreen(),
    );
  }
}
