import 'package:flutter/material.dart';
import 'package:islami_c8_monday/home_screen.dart';
import 'package:islami_c8_monday/my_theme.dart';
import 'package:islami_c8_monday/sura_content.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraContent.routeName: (context) => SuraContent(),
      },
    );
  }
}
