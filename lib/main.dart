import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/HadethTab/hadeth_content.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/homescreen.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran%20tab/quran_screen.dart';
import 'package:islami_app/quran%20tab/suracontent.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Quraan.screenName: (context) => Quraan(),
        HadethContent.routeName: (context) => HadethContent(),
        SuraContent.routeName: (context) => SuraContent()
      },
      theme: Themes.MyTheme,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(provider.lang),
      darkTheme: Themes.darkTheme,
      themeMode: provider.appTheme,
    );
  }
}
