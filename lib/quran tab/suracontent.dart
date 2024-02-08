import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran%20tab/quran_screen.dart';
import 'package:provider/provider.dart';

class SuraContent extends StatefulWidget {
  static const String routeName = 'suraContent';

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  List<String> list1 = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var suracontent =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (list1.isEmpty) {
      readFiles(suracontent.index);
    }

    return Stack(children: [
      Image.asset((provider.isLight())
          ? 'assets/images/default_bg.png'
          : 'assets/images/dark_bg.png'),
      Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.islami,
          style: Theme.of(context).textTheme.titleLarge,
        )),
        body: list1.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Text(suracontent.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.right),
                  Divider(
                    color:
                        provider.isLight() ? Themes.primColor : Themes.yellow,
                    thickness: 2,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: provider.isLight()
                                  ? Themes.blackColor
                                  : Themes.yellow),
                          '${list1[index]}(${index + 1})');
                    },
                    itemCount: list1.length,
                  ))
                ],
              ),
      ),
    ]);
  }

  void readFiles(int index) async {
    String content = await rootBundle
        .loadString('assets/Quranfiles/Quranfiles/${index + 1}.txt');
    List<String> lines = content.split('\n');
    list1 = lines;
    setState(() {});
  }
}
