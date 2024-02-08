import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  String rotatedText = 'سبحان الله';
  int counter = 0;
  double angle = 10;
  int i = 0;
  List<String> ad3ya = [
    "سبحان الله ",
    "الحمد لله",
    'الله اكبر',
    "لا اله الا الله"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(children: [
      Image.asset(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          (provider.isLight())
              ? 'assets/images/default_bg.png'
              : 'assets/images/dark_bg.png'),
      Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami,
                style: TextStyle(
                    color: provider.isLight()
                        ? Themes.blackColor
                        : Themes.white))),
        body: Center(
          child: Column(
            children: [
              Container(
                child: Image.asset(provider.isLight()
                    ? 'assets/images/head_sebha_logo.png'
                    : 'assets/images/head_sebha_dark.png'),
              ),
              Transform.rotate(
                  angle: angle,
                  child: InkWell(
                      child: Image.asset(provider.isLight()
                          ? 'assets/images/body_sebha_logo.png'
                          : 'assets/images/body_sebha_dark.png'),
                      onTap: () {
                        angle += 10;

                        rotatedText = ad3ya[i];
                        counter++;
                        if (counter > 33) {
                          counter = 0;
                          if (i == ad3ya.length - 1) {
                            i = 0;
                          } else {
                            i++;
                          }
                        }

                        setState(() {});
                      })),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Text(AppLocalizations.of(context)!.number_of_praises,
                      style: TextStyle(
                          color: provider.isLight()
                              ? Themes.blackColor
                              : Themes.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600))),
              Container(
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 70,
                width: 60,
                decoration: BoxDecoration(
                    color:
                        provider.isLight() ? Themes.primColor : Themes.darkBlue,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        color: provider.isLight()
                            ? Themes.blackColor
                            : Themes.white),
                    '$counter'),
              ),
              Container(
                child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: provider.isLight()
                            ? Themes.white
                            : Themes.darkBlue),
                    '$rotatedText'),
                decoration: BoxDecoration(
                    color:
                        provider.isLight() ? Themes.primColor : Themes.yellow,
                    borderRadius: BorderRadius.circular(20)),
                width: 150,
                height: 50,
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
