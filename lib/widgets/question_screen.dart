import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    super.key,
    required this.questionData,
    required this.questionNumber,
    required this.totalQuestions,
    required this.onAnswerSelected,
  });

  final Map<String, Object> questionData;
  final int questionNumber;
  final int totalQuestions;
  final void Function(String selectedAnswer) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    // Cast the options from Object to List<String>
    final List<String> options = questionData['options'] as List<String>;
    final String questionText = questionData['question'] as String;

    return Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Current Question Number
          Text(
            'Question $questionNumber of $totalQuestions',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 20),

          // Question Card/Container
          Card(
            color: Colors.black45,
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  // color: Theme.of(context).colorScheme.primary,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Answer Options (Buttons)
          ...options.map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  onAnswerSelected(option); // Call the function to handle answer selection
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  option,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
