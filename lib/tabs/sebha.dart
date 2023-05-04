import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaScreenState();
}
int numOfTasbeh = 0;

int typeOfTasbehIndex = 0;
List<String> typeOfTasbeh = ["سبحان الله","الحمد لله","لا إله إلا الله","لا حول ولا قوة إلا بالله","الله أكبر"];
class _SebhaScreenState extends State<SebhaTab> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: GestureDetector(
                onTap: (){
                  if(numOfTasbeh>=0 && numOfTasbeh<33){
                    numOfTasbeh++;
                  }else{
                    numOfTasbeh = 0;
                    typeOfTasbehIndex++;
                    if(typeOfTasbehIndex>typeOfTasbeh.length-1){
                      typeOfTasbehIndex = 0;
                    }
                  }
                  setState(() {

                  });
                },
                child: Image(
                  image: Theme.of(context).brightness == Brightness.light ? AssetImage("assets/images/sebha_ic.png") : AssetImage("assets/images/dark_sebha.png"),
                ),
              )),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              "عدد التسبيحات",
              textAlign: TextAlign.center,
              style: Theme.of(context).brightness == Brightness.light ? Theme.of(context).textTheme.bodyMedium : Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
            ),
          ),
          Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).brightness == Brightness.light ? Color(0xffB7935F) : Color(0xff141A2E)),
              child: Text(
                "$numOfTasbeh",
                textAlign: TextAlign.center,
                style: Theme.of(context).brightness == Brightness.light ? Theme.of(context).textTheme.bodyMedium : Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
              )),
          Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).brightness == Brightness.light ? Color(0xffB7935F) : Color(0xffFACC1D)),
              child: Text(
                typeOfTasbeh[typeOfTasbehIndex],
                textAlign: TextAlign.center,
                style: Theme.of(context).brightness == Brightness.light ? Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white) : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Color(0xff141A2E)),
              )),
          Expanded(
            child: SizedBox(
            ),
          )
        ],
      ),
    );
  }
}
