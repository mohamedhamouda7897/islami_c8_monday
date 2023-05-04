import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];

  void loadFile(int n) async {
    String sura = await rootBundle.loadString("assets/files/${n + 1}.txt");
    List<String> lines = sura.split("\n");
    print(lines);
    verses = lines;
    notifyListeners();
  }
}
