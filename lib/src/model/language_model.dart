class LanguageModel {
  final String languageName;
  final String value;

  const LanguageModel({
    required this.languageName,
    required this.value,
  });
}


class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}


List<Note> sampleNotes = [
  Note(
    id: 0,
    title: 'New Note',
    content:
    '+',
    modifiedTime: DateTime(2023,9,9,34,5),
  ),
];
