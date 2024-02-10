import 'package:flutter/material.dart';
import '../../model/language_model.dart';

class NotePage extends StatefulWidget {
  final Note? note;
  const NotePage({super.key, this.note});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController titleText = TextEditingController();
  TextEditingController conText = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      titleText = TextEditingController(text: widget.note!.title);
      conText = TextEditingController(text: widget.note!.content);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Back"),
        actions: const [
          Icon(Icons.photo_outlined),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 15),
            child: Icon(Icons.feed_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleText.text.isEmpty && conText.text.isEmpty) {
            return;
          } else {
            Navigator.pop(context, [
              titleText.text,
              conText.text,
            ]);
          }
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.save,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    maxLines: 6,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter title of note...",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 30)),
                    controller: titleText,
                  ),
                  TextField(
                    maxLines: 6,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText:
                          "This is where your note will be. It’ll \nbe housed here. You’ll save your \nnote here. Type your memories here. \nWrite down your thoughts.",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    controller: conText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
