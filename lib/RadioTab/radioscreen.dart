import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/radio_image.png'),
              Text(
                AppLocalizations.of(context)!.quran_karim_broadcast,
                style: TextStyle(
                    color:
                        provider.isLight() ? Themes.blackColor : Themes.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Image.asset(provider.isLight()
                    ? 'assets/images/pause & continue.png'
                    : 'assets/images/Group 5.png'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
