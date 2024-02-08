import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/HadethTab/hadeth_screen.dart';
import 'package:islami_app/RadioTab/radioscreen.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran%20tab/quran_screen.dart';
import 'package:islami_app/sebhaTab/sebhascreen.dart';
import 'package:islami_app/settings/settings_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int TapedItem = 0;

  List<Widget> taps = [Quraan(), Hadeth(), Sebha(), RadioScreen(), Settings()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
        body: taps[TapedItem],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            selectedIconTheme: IconThemeData(
                color:
                    (provider.isLight() ? Themes.blackColor : Themes.yellow)),
            showUnselectedLabels: true,
            onTap: (index) {
              TapedItem = index;
              setState(() {});
            },
            currentIndex: TapedItem,
            items: [
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.quran,
                  icon: ImageIcon(AssetImage('assets/images/icon_quran.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.hadeth,
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.sebha,
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.radio,
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.settings,
                  icon: Icon(Icons.settings)),
            ],
          ),
        ));
  }
}
