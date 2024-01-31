import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../features/home/home_page.dart';
import '../features/home/note_page.dart';
import '../model/language_model.dart';

class ProFunc extends ChangeNotifier {
  late Box box;
  Locale globalLocal = const Locale("en");
  int n = 0;


  void changeIn(int index) {
    notifyListeners();
  }
  void changeUp(int index) {
    notifyListeners();
  }


  String? nameUp(value) {
    if (value != null && !RegExp(r".{3,}").hasMatch(value)) {
      return 'at least 3 characters';
    }
    return null;
  }
  String? emailUp(value) {
    if (value != null && !RegExp(r".{6,}@gmail.com").hasMatch(value)) {
      return 'enter your email correctly';
    }
    return null;
  }
  String? passwordUp(value) {
    if (value != null && !RegExp(r".{8,}").hasMatch(value)) {
      return 'at least 8 characters';
    }
    return null;
  }


  void login(email, pass) {
    box.put(email.text, pass.text);
    notifyListeners();
  }
  void createBox(email, pass) async {
    box = await Hive.openBox("EmailPass");
    getdate(email, pass);
  }
  void getdate(email, pass) async {
    if (box.get(email) != null) {
      email.text = box.get('EmailPass');
    }
    if (box.get(pass) != null) {
      pass.text = box.get('EmailPass');
    }
  }


  void pressed(Locale newLocale) {
    globalLocal = newLocale;
    notifyListeners();
  }
  void createNote(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const NotePage(),
      ),
    );
    if (result != null) {
      sampleNotes.add(Note(
          id: sampleNotes.length,
          title: result[0],
          content: result[1],
          modifiedTime: DateTime.now()));
      filteredNotes = sampleNotes;
    }
    notifyListeners();
  }
  void updateNote(BuildContext context, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => NotePage(
          note: sampleNotes[index],
        ),
      ),
    );
    if (result != null) {
      int orginalIndex = sampleNotes.indexOf(filteredNotes[index]);
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
    }
    notifyListeners();
  }
  void longGesture(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Dalete?"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Yes"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("No"),
          ),
        ],
      ),
    );
  }
}
