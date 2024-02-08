import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class BottomShet extends StatelessWidget {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        InkWell(
            child: (provider.lang == 'en')
                ? getSelectedItem(AppLocalizations.of(context)!.english)
                : getUnselectedItem(AppLocalizations.of(context)!.english),
            onTap: () {
              provider.checkLanguage('en');
            }),
        SizedBox(height: 15),
        InkWell(
            onTap: () {
              provider.checkLanguage('ar');
            },
            child: (provider.lang == 'ar')
                ? getSelectedItem(AppLocalizations.of(context)!.arabic)
                : getUnselectedItem(AppLocalizations.of(context)!.arabic))
      ],
    );
  }

  Widget getSelectedItem(String text) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(text,
          style: TextStyle(
              color: (provider.isLight() ? Themes.primColor : Themes.yellow),
              fontSize: 25)),
      Icon(
        Icons.check,
        color: provider.isLight() ? Themes.primColor : Themes.darkBlue,
      )
    ]);
  }

  Widget getUnselectedItem(String text) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(text,
          style: TextStyle(
              fontSize: 25,
              color:
                  (provider.isLight() ? Themes.blackColor : Themes.darkBlue))),
      Icon(Icons.check,
          color: provider.isLight() ? Themes.blackColor : Themes.darkBlue)
    ]);
  }
}
