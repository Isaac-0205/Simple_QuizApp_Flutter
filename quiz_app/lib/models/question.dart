class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

const List<Question> questions = [
  Question(
    text: 'What does "MAD" stand for in mobile development courses?',
    options: [
      'Mobile App Design',
      'Mobile Application Development',
      'Managed Android Development',
      'Modern App Deployment',
    ],
    correctIndex: 1,
  ),
  Question(
    text: 'Which language is primarily used for Flutter development?',
    options: ['Java', 'Kotlin', 'Dart', 'Swift'],
    correctIndex: 2,
  ),
  Question(
    text: 'Which widget is used to display scrollable lists in Flutter?',
    options: ['Column', 'Row', 'ListView', 'Stack'],
    correctIndex: 2,
  ),
  Question(
    text: 'What is the entry point of every Flutter app?',
    options: ['runApp()', 'main()', 'init()', 'start()'],
    correctIndex: 1,
  ),
  Question(
    text: 'Which widget is the base for Material Design apps in Flutter?',
    options: ['Scaffold', 'Container', 'MaterialApp', 'AppBar'],
    correctIndex: 2,
  ),
];
