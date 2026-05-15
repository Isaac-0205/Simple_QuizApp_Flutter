import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _nameController = TextEditingController();
  String _errorText = '';

  void _startQuiz() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() => _errorText = 'Please enter your name to continue.');
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => QuizScreen(playerName: name)),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.quiz_rounded, size: 80, color: Color(0xFF5C6BC0)),
                const SizedBox(height: 16),
                const Text(
                  'Flutter Quiz',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3949AB),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '5 questions about Flutter & MAD',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 48),
                TextField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    hintText: 'Enter your name',
                    prefixIcon: const Icon(Icons.person_outline),
                    errorText: _errorText.isEmpty ? null : _errorText,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (_) {
                    if (_errorText.isNotEmpty) {
                      setState(() => _errorText = '');
                    }
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _startQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5C6BC0),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Start Quiz',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
