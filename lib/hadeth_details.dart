import 'package:flutter/material.dart';
import 'package:islami_c8_monday/HadethModel.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
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
                args.hadethName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            body: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Card(
                    margin: EdgeInsets.all(17),
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        args.content,
                        textDirection: TextDirection.rtl,
                      ),
                    )),
              ),
            )));
  }
}
