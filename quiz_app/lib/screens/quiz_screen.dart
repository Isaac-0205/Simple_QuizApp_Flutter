import 'package:flutter/material.dart';
import '../models/question.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String playerName;

  const QuizScreen({super.key, required this.playerName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int? _selectedOption;
  int _score = 0;
  bool _answered = false;

  Question get _currentQuestion => questions[_currentIndex];

  void _selectOption(int index) {
    if (_answered) return;
    setState(() {
      _selectedOption = index;
      _answered = true;
      if (index == _currentQuestion.correctIndex) _score++;
    });
  }

  void _next() {
    if (_currentIndex < questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
        _answered = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            playerName: widget.playerName,
            score: _score,
            total: questions.length,
          ),
        ),
      );
    }
  }

  Color _optionColor(int index) {
    if (!_answered) return Colors.white;
    if (index == _currentQuestion.correctIndex) return const Color(0xFFE8F5E9);
    if (index == _selectedOption) return const Color(0xFFFFEBEE);
    return Colors.white;
  }

  Color _optionBorderColor(int index) {
    if (!_answered) {
      return index == _selectedOption
          ? const Color(0xFF5C6BC0)
          : Colors.grey.shade300;
    }
    if (index == _currentQuestion.correctIndex) return Colors.green;
    if (index == _selectedOption) return Colors.red;
    return Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentIndex + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C6BC0),
        foregroundColor: Colors.white,
        title: Text('Hi, ${widget.playerName}!'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${_currentIndex + 1} of ${questions.length}',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(
                    'Score: $_score',
                    style: const TextStyle(
                      color: Color(0xFF3949AB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade300,
                  color: const Color(0xFF5C6BC0),
                ),
              ),
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  _currentQuestion.text,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ...List.generate(_currentQuestion.options.length, (i) {
                return GestureDetector(
                  onTap: () => _selectOption(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: _optionColor(i),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: _optionBorderColor(i), width: 2),
                    ),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: i,
                          groupValue: _selectedOption,
                          onChanged: _answered ? null : (v) => _selectOption(v!),
                          activeColor: const Color(0xFF5C6BC0),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _currentQuestion.options[i],
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        if (_answered && i == _currentQuestion.correctIndex)
                          const Icon(Icons.check_circle, color: Colors.green),
                        if (_answered &&
                            i == _selectedOption &&
                            i != _currentQuestion.correctIndex)
                          const Icon(Icons.cancel, color: Colors.red),
                      ],
                    ),
                  ),
                );
              }),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _answered ? _next : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C6BC0),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _currentIndex < questions.length - 1
                        ? 'Next Question'
                        : 'See Results',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
