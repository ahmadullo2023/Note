import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../../model/language_model.dart';
import '../../view/provider.dart';
import '../profil/profil_page.dart';
import 'note_page.dart';

List<Note> filteredNotes = [];
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ListTile(
          title: Text(
            "Note.d",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          subtitle: Text("Enjoy note taking with friends"),
          trailing: IconButton(
              icon: Icon(Icons.account_circle_rounded,size: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext) => ProfilPage(),
                  ),
                );
              }
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 240),
        itemCount: sampleNotes.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(8.0),
          child: index == 0
              ? GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const NotePage(),
                ),
              );
              if (result != null) {
                setState(() {
                  sampleNotes.add(Note(
                      id: sampleNotes.length,
                      title: result[0],
                      content: result[1],
                      modifiedTime: DateTime.now()));
                  filteredNotes = sampleNotes;
                });
              }
            },
            child: Container(
              height: 300,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFB9E6FE),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 45),
                  Icon(
                    Icons.add_circle_outline_rounded,
                    size: 50,
                  ),
                  Text(
                    "New note",
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
              : GestureDetector(
            onLongPress: () => Provider.of<ProFunc>(context, listen: false).longGesture(context),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => NotePage(
                    note: sampleNotes[index],
                  ),
                ),
              );
              if (result != null) {
                setState(() {
                  int orginalIndex =
                  sampleNotes.indexOf(filteredNotes[index]);
                  sampleNotes[orginalIndex] = (Note(
                      id: sampleNotes[orginalIndex].id,
                      title: result[0],
                      content: result[1],
                      modifiedTime: DateTime.now()));
                  filteredNotes[index] = Note(
                      id: filteredNotes[index].id,
                      title: result[0],
                      content: result[1],
                      modifiedTime: DateTime.now());
                });
              }
            },
            child: Container(
              height: 300,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      sampleNotes[index].title,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                      maxLines: 1,
                    ),
                  ),
                  Text(sampleNotes[index].content, maxLines: 6,
                    overflow: TextOverflow.ellipsis,),
                  Spacer(),
                  Text(
                    '${sampleNotes[index].modifiedTime}',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
