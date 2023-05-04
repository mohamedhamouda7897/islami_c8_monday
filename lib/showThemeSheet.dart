import 'package:flutter/material.dart';
import 'package:islami_c8_monday/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ShowThemeSheet extends StatefulWidget {
  const ShowThemeSheet({Key? key}) : super(key: key);

  @override
  State<ShowThemeSheet> createState() => _ShowThemeSheetState();
}

class _ShowThemeSheetState extends State<ShowThemeSheet> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              pro.changeTheme(ThemeMode.light);
            },
            child: Row(
              children: [
                Text(
                  "Light",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: pro.themeMode == ThemeMode.light
                          ? Theme.of(context).primaryColor
                          : Colors.white),
                ),
                Spacer(),
                Icon(
                  Icons.done,
                  size: 30,
                  color: pro.themeMode == ThemeMode.light
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              pro.changeTheme(ThemeMode.dark);
            },
            child: Row(
              children: [
                Text(
                  "Dark",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: pro.themeMode == ThemeMode.dark
                          ? Theme.of(context).colorScheme.secondary
                          : Colors.black54),
                ),
                Spacer(),
                Icon(
                  Icons.done,
                  color: pro.themeMode == ThemeMode.dark
                      ? Theme.of(context).colorScheme.secondary
                      : Colors.black54,
                  size: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
