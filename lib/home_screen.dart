import 'package:flutter/material.dart';
import 'package:islami_c8_monday/tabs/ahadeth.dart';
import 'package:islami_c8_monday/tabs/quran.dart';
import 'package:islami_c8_monday/tabs/radio.dart';
import 'package:islami_c8_monday/tabs/sebha.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> tabs = [QuranTab(), SebhaTab(), RadioTab(), AhadethTab()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/main_bg.png",
              fit: BoxFit.fill,
            )),
        Scaffold(
          appBar: AppBar(
            title: Text("Islami", style: Theme.of(context).textTheme.bodyLarge),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/quran.png")),
                label: "Quran",
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/sebha.png")),
                label: "Sebha",
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/radio.png")),
                label: "Radio",
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/ahadeth.png")),
                label: "Ahadeth",
              ),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }
}
