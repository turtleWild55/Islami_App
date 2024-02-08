import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/HadethTab/hadeth_screen.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethContent extends StatelessWidget {
  static const routeName = 'hadethcontent';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    HadethItem item = ModalRoute.of(context)?.settings.arguments as HadethItem;
    List<String> content = item.content;
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
                  style: Theme.of(context).textTheme.titleLarge)),
          body: Column(children: [
            Center(child: Image.asset('assets/images/hadeth_logo.png')),
            Divider(
              color: provider.isLight() ? Themes.primColor : Themes.yellow,
              thickness: 3,
            ),
            Text(
              item.title,
              style: TextStyle(
                  fontSize: 20,
                  color: provider.isLight() ? Themes.blackColor : Themes.white,
                  fontWeight: FontWeight.w400),
            ),
            Divider(
              color: provider.isLight() ? Themes.primColor : Themes.yellow,
              thickness: 3,
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                    style: TextStyle(
                        fontSize: 20,
                        color: provider.isLight()
                            ? Themes.blackColor
                            : Themes.white,
                        fontWeight: FontWeight.w400),
                    item.content[index]);
              },
              itemCount: content.length,
            ))
          ]))
    ]);
  }
}
