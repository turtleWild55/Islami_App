import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_themes.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:islami_app/quran%20tab/suracontent.dart';
import 'package:provider/provider.dart';

class Quraan extends StatelessWidget {
  static String screenName = 'quraanscreen';
  List<String> suranames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

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
              title: Text(
            AppLocalizations.of(context)!.islami,
            style: Theme.of(context).textTheme.titleLarge,
          )),
          body: Column(
            children: [
              Center(
                  child: Image.asset('assets/images/qur2an_screen_logo.png')),
              Divider(
                color: provider.isLight() ? Themes.primColor : Themes.yellow,
                thickness: 3,
              ),
              Text(
                AppLocalizations.of(context)!.sura_name,
                style: TextStyle(
                    color:
                        (provider.isLight() ? Themes.blackColor : Themes.white),
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: provider.isLight() ? Themes.primColor : Themes.yellow,
                thickness: 3,
              ),
              Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: provider.isLight()
                              ? Themes.primColor
                              : Themes.yellow,
                          thickness: 2,
                        );
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                SuraContent.routeName,
                                arguments: SuraDetailsArgs(
                                    name: suranames[index], index: index));
                          },
                          child: Text(
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.titleLarge,
                              suranames[index]),
                        );
                      },
                      itemCount: suranames.length))
            ],
          ),
        )
      ],
    );
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
