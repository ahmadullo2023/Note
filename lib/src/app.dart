import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/src/view/provider.dart';
import 'package:note_app/src/widget/splash.dart';
import 'package:provider/provider.dart';
import '../service/app_localizations.dart';
import 'features/home/home_screen.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProFunc(),
      builder: (context, child){
        return  ValueListenableBuilder(
          valueListenable: Hive.box("openBox").listenable(),
          builder: (context, box, child){
            final isDarks = box.get("values", defaultValue: false);
            final local = Provider.of<ProFunc>(context,listen: true).globalLocal;
            return  MaterialApp(
              theme: isDarks ? ThemeData.dark() : ThemeData.light(),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: local,
              home: const SplashPage(),
            );
          },
        );
      },
    );
  }
}