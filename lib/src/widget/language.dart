import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../service/app_localizations.dart';
import '../features/auth/log_in.dart';
import '../model/language_model.dart';
import '../view/provider.dart';


class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

List<LanguageModel> languages = [
  LanguageModel(
    languageName: "Uzbek",
    value: "uz",
  ),
  LanguageModel(
    languageName: "Russian",
    value: "ru",
  ),
  LanguageModel(
    languageName: "English",
    value: "en",
  ),
];

List<Locale> localeList = const [
  Locale("uz"),
  Locale("ru"),
  Locale("en"),
];

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    final pressed = Provider.of<ProFunc>(context).pressed;
    return Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment(-0.8, -0.9),
              child: Text(
                AppLocalizations.of(context).languageApp,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Image.asset(
                "assets/images/Group 27.png",
                height: 350,
                width: 350,
              ),
            ),
            Align(
              alignment: Alignment(0, .7),
              child: SizedBox(
                height: 120,
                child: CupertinoPicker(
                  magnification: 1.4,
                  useMagnifier: true,
                  itemExtent: 50,
                  selectionOverlay: const SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Divider(),
                        Divider(),
                      ],
                    ),
                  ),
                  scrollController: FixedExtentScrollController(initialItem: 1),
                  onSelectedItemChanged: (int selectedItem) =>
                      pressed(localeList[selectedItem]),
                  children: List<Widget>.generate(languages.length, (int index) {
                    return Center(child: Text(languages[index].languageName));
                  }),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.9),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF36BFFA),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LogInPage(),
                        ),
                      );
                    },
                    child: Text(AppLocalizations.of(context).next),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
