import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c8_monday/my_theme.dart';
import 'package:islami_c8_monday/providers/sura_details_provider.dart';
import 'package:islami_c8_monday/sura_args.dart';
import 'package:provider/provider.dart';

class SuraContent extends StatelessWidget {
  static const String routeName = "SuraContent";

  @override
  Widget build(BuildContext context) {
    SuraArgs args = ModalRoute.of(context)?.settings.arguments as SuraArgs;

    return ChangeNotifierProvider(
        create: (context) => SuraDetailsProvider()..loadFile(args.index),
        builder: (context, child) {
          var provider = Provider.of<SuraDetailsProvider>(context);
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    Brightness.dark == Theme.of(context).colorScheme.brightness
                        ? "assets/images/dark_bg.png"
                        : "assets/images/main_bg.png",
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
              body: provider.verses.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: MyThemeData.lightColor,
                    ))
                  : Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: MyThemeData.lightColor)),
                      margin:
                          EdgeInsets.symmetric(vertical: 28, horizontal: 16),
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
                              provider.verses[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.elMessiri(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          );
                        },
                        itemCount: provider.verses.length,
                      ),
                    ),
            ),
          );
        });
  }
}
