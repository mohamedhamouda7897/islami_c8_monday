import 'package:flutter/material.dart';
import 'package:islami_c8_monday/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ShowLanguageSheet extends StatelessWidget {
  const ShowLanguageSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            provider.changLanguage("en");
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Text(
                "English",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: provider.languageCode == "en"
                        ? Theme.of(context).primaryColor
                        : Colors.black54),
              ),
              Spacer(),
              Icon(
                Icons.done,
                size: 30,
                color: provider.languageCode == "en"
                    ? Theme.of(context).primaryColor
                    : Colors.black54,
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            provider.changLanguage("ar");
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Text(
                "Arabic",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: provider.languageCode != "en"
                        ? Theme.of(context).primaryColor
                        : Colors.black54),
              ),
              Spacer(),
              Icon(
                Icons.done,
                size: 30,
                color: provider.languageCode != "en"
                    ? Theme.of(context).primaryColor
                    : Colors.black54,
              )
            ],
          ),
        ),
      ],
    );
  }
}
