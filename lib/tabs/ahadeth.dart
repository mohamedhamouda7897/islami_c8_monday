import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c8_monday/HadethModel.dart';
import 'package:islami_c8_monday/hadeth_details.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadFile();
    }
    return Column(
      children: [
        Image.asset("assets/images/hadeth_bg.png"),
        Divider(
          thickness: 2,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          "Ahadeth",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          thickness: 2,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
              endIndent: 35,
              indent: 35,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  allAhadeth[index].hadethName,
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: allAhadeth.length,
          ),
        ),
      ],
    );
  }

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
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
