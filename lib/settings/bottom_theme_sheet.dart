import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class BottomThemeSheet extends StatelessWidget {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              child: (provider.isLight())
                  ? getSelectedItem(AppLocalizations.of(context)!.light)
                  : getUnselectedItem(AppLocalizations.of(context)!.light),
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              }),
          SizedBox(height: 15),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: (provider.isLight())
                  ? getUnselectedItem(AppLocalizations.of(context)!.dark)
                  : getSelectedItem(AppLocalizations.of(context)!.dark))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(text,
          style: TextStyle(
              color: (provider.isLight()) ? Themes.primColor : Themes.yellow,
              fontSize: 25)),
      Icon(Icons.check,
          color: (provider.isLight()) ? Themes.primColor : Themes.yellow)
    ]);
  }

  Widget getUnselectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: TextStyle(
                color:
                    (provider.isLight()) ? Themes.blackColor : Themes.darkBlue,
                fontSize: 25)),
        Icon(Icons.check,
            color: (provider.isLight()) ? Themes.blackColor : Themes.darkBlue)
      ],
    );
  }
}
