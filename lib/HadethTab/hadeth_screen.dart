import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/HadethTab/hadeth_content.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class Hadeth extends StatefulWidget {
  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  List<HadethItem> hadethObjects = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (hadethObjects.isEmpty) {
      readFile();
    }
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
              title: Text(
            AppLocalizations.of(context)!.islami,
            style: Theme.of(context).textTheme.titleLarge,
          )),
          body: Column(
            children: [
              Center(child: Image.asset('assets/images/hadeth_logo.png')),
              Divider(
                color: provider.isLight() ? Themes.primColor : Themes.yellow,
                thickness: 3,
              ),
              Text(
                AppLocalizations.of(context)!.hadeth,
                style: TextStyle(
                    color:
                        provider.isLight() ? Themes.blackColor : Themes.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Divider(
                  color: provider.isLight() ? Themes.primColor : Themes.yellow,
                  thickness: 3),
              (hadethObjects.isEmpty)
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                            color: provider.isLight()
                                ? Themes.primColor
                                : Themes.yellow,
                            thickness: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  HadethContent.routeName,
                                  arguments: HadethItem(
                                      title: hadethObjects[index].title,
                                      content: hadethObjects[index].content));
                            },
                            child: Text(
                                textAlign: TextAlign.center,
                                hadethObjects[index].title,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: provider.isLight()
                                        ? Themes.blackColor
                                        : Themes.white,
                                    fontWeight: FontWeight.w400)),
                          );
                        },
                        itemCount: hadethObjects.length,
                      ),
                    ),
            ],
          )),
    ]);
  }

  void readFile() async {
    String content = await rootBundle.loadString('assets/hadeth/ahadeth.txt');
    List<String> ahadethCategory = content.split('#\r\n');
    for (int i = 0; i < ahadethCategory.length; i++) {
      List<String> hadethLines = [];
      hadethLines = ahadethCategory[i].split('\n');

      String title = hadethLines[0];
      hadethLines.removeAt(0);

      HadethItem hadeth = HadethItem(title: title, content: hadethLines);
      hadethObjects.add(hadeth);
      setState(() {});
    }
  }
}

class HadethItem {
  String title;
  List<String> content;

  HadethItem({required this.title, required this.content});
}
