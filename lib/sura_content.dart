import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c8_monday/my_theme.dart';
import 'package:islami_c8_monday/sura_args.dart';

class SuraContent extends StatefulWidget {
  static const String routeName = "SuraContent";

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraArgs args = ModalRoute.of(context)?.settings.arguments as SuraArgs;

    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/main_bg.png",
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.suraName,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: verses.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: MyThemeData.lightColor,
              ))
            : Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: MyThemeData.lightColor)),
                margin: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                    color: Theme.of(context).primaryColor,
                    indent: 42,
                    endIndent: 42,
                  ),
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        verses[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.elMessiri(
                            fontSize: 18, color: Colors.black54),
                      ),
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      ),
    );
  }

  void loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split("\n");
    print(lines);
    verses = lines;
    setState(() {});
  }
}
