import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/src/app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox("openBox");
  await Hive.openBox("EmailPassword");
  if(!Hive.isBoxOpen("openBox")){
    await Hive.openBox("openBox");
  }
  if(!Hive.isBoxOpen("EmailPassword")){
    await Hive.openBox("EmailPassword");
  }
  runApp(App());
}
