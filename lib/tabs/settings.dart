import 'package:flutter/material.dart';
import 'package:islami_c8_monday/providers/my_provider.dart';
import 'package:islami_c8_monday/showThemeSheet.dart';
import 'package:provider/provider.dart';

import '../showLanguageSheet.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Theming",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {
              showThemeSheet();
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: provider.themeMode == ThemeMode.light
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.secondary)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  provider.themeMode == ThemeMode.light ? "Light" : "Dark",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.themeMode == ThemeMode.light
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Language",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {
              showLanguageSheet();
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: provider.themeMode == ThemeMode.light
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.secondary)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  provider.languageCode == "en" ? "English" : "عربي",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: provider.themeMode == ThemeMode.light
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShowLanguageSheet();
      },
    );
  }

  void showThemeSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(18), topLeft: Radius.circular(18))),
        builder: (context) {
          return ShowThemeSheet();
        });
  }
}
