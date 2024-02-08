import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/settings/bottom_theme_sheet.dart';
import 'package:islami_app/settings/bottomsheet.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      Image.asset(
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          (provider1.isLight())
              ? 'assets/images/default_bg.png'
              : 'assets/images/dark_bg.png'),
      Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.islami,
          style: Theme.of(context).textTheme.titleLarge,
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.language,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
            InkWell(
              onTap: () {
                createBottomSheet(context);
              },
              child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        (provider1.isLight()) ? Themes.primColor : Themes.white,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            (provider1.lang == 'en')
                                ? AppLocalizations.of(context)!.english
                                : AppLocalizations.of(context)!.arabic,
                            style: TextStyle(
                                color: (provider1.isLight()
                                    ? Themes.blackColor
                                    : Themes.darkBlue))),
                        Icon(Icons.arrow_drop_down)
                      ])),
            ),
            InkWell(
              onTap: () {
                createThemeBottomShet(context);
              },
              child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (provider1.isLight())
                          ? Themes.primColor
                          : Themes.white),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            (provider1.lang == 'en')
                                ? AppLocalizations.of(context)!.mode
                                : AppLocalizations.of(context)!.mode,
                            style: TextStyle(
                                color: (provider1.isLight()
                                    ? Themes.blackColor
                                    : Themes.darkBlue))),
                        Icon(Icons.arrow_drop_down)
                      ])),
            )
          ],
        ),
      )
    ]);
  }

  void createThemeBottomShet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => BottomThemeSheet());
  }
}

void createBottomSheet(BuildContext con) {
  showModalBottomSheet(context: con, builder: (con) => BottomShet());
}
