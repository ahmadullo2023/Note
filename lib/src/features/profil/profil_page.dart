import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../service/app_localizations.dart';
import '../auth/log_in.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}
class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext) => LogInPage(),
                  ),
                );
              },
              icon: Icon(Icons.logout))
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.account_circle, size: 100),
                Text(
                  "Your name",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                IconButton(onPressed: () {},
                  icon: Icon(Icons.camera_alt_outlined),
                ),
                IconButton(onPressed: () {},
                  icon: Icon(Icons.create),
                )
              ],
            ),
            SizedBox(height: 40),
            ValueListenableBuilder(
              valueListenable: Hive.box("openBox").listenable(),
              builder: (context, box, child) {
                final isDarks = box.get("values", defaultValue: false);
                return SwitchListTile.adaptive(
                  value: isDarks,
                  onChanged: (value) {
                    box.put("values", value);
                  },
                  title: Text(
                    AppLocalizations.of(context).theme,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.blue,
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
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 59,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    width: 1,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  children: [
                    Text("Language", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                    Spacer(),
                    Icon(Icons.language),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 59,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    width: 1,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  children: [
                    Text("Secret notes", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                    Spacer(),
                    Icon(Icons.lock),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
