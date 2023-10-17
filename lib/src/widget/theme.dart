import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../service/app_localizations.dart';
import 'language.dart';


// bool isDark = true;


class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  // void changeTheme(bool value) {
  //   setState(() {
  //     isDark = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Text(
              AppLocalizations.of(context).themeApp,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          Align(
            alignment: const Alignment(-0.3, -0.3),
            child: Image.asset(
              "assets/images/image 4.png",
              height: 300,
            ),
          ),
          Align(
            alignment: const Alignment(0.3, -0.1),
            child: Image.asset("assets/images/image 5.png", height: 300),
          ),
          Align(
            alignment: const Alignment(0, .7),
            child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ValueListenableBuilder(
                  valueListenable: Hive.box("openBox").listenable(),
                  builder: (context, box, child){
                    final isDarks = box.get("values", defaultValue: false);
                    return SwitchListTile.adaptive(
                      value: isDarks,
                      onChanged:(value) {
                        box.put("values", value);
                      },
                      title: Text(
                        AppLocalizations.of(context).theme,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                )
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF36BFFA),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const LanguagePage(),
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context).next),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}