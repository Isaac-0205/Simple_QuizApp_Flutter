import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final String playerName;
  final int score;
  final int total;

  const ResultScreen({
    super.key,
    required this.playerName,
    required this.score,
    required this.total,
  });

  String get _remark {
    final pct = score / total;
    if (pct == 1.0) return 'Perfect score! Excellent!';
    if (pct >= 0.8) return 'Great job, keep it up!';
    if (pct >= 0.6) return 'Good effort, almost there!';
    if (pct >= 0.4) return 'Keep studying, you\'ll get it!';
    return 'Don\'t give up, try again!';
  }

  Color get _scoreColor {
    final pct = score / total;
    if (pct >= 0.8) return Colors.green;
    if (pct >= 0.6) return const Color(0xFFFFA000);
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.emoji_events_rounded,
                  size: 80,
                  color: Color(0xFFFFB300),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Quiz Complete!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3949AB),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Well done, $playerName!',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Your Score',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$score',
                              style: TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                                color: _scoreColor,
                              ),
                            ),
                            TextSpan(
                              text: ' / $total',
                              style: const TextStyle(
                                fontSize: 28,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _remark,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (_) => false,
                      );
                    },
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text(
                      'Play Again',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5C6BC0),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
