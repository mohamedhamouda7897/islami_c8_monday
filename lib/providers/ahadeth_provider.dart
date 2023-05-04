import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../HadethModel.dart';

class AhadethProvider extends ChangeNotifier {
  List<HadethModel> allAhadeth = [];

  void loadFile() {
    // try{
    //   String AhadethFile =
    //   await rootBundle.loadString("assets/files/ahadeth.txt");
    // }catch(error){
    //   print(error);
    // }
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadethFile) {
      List<String> AhadethContent = ahadethFile.split("#");

      for (int i = 0; i < AhadethContent.length; i++) {
        int lastIndex = AhadethContent[i].trim().indexOf("\n");
        String title = AhadethContent[i].trim().substring(0, lastIndex);
        String content = AhadethContent[i].trim().substring(lastIndex + 1);
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
      }

      //"Mohamed" // .trim() >> "Mohamed"

      // for (int i = 0; i < AhadethContent.length; i++) {
      //   List<String> SingleHadethlines = AhadethContent[i].trim().split("\n");
      //   String title = SingleHadethlines[0];
      //   SingleHadethlines.removeAt(0);
      //   List<String> content = SingleHadethlines;
      //   HadethModel hadethModel = HadethModel(title, content);
      //   allAhadeth.add(hadethModel);
      // }
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
