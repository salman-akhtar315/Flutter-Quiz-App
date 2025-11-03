// quiz_app.dart

import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'widgets/question_screen.dart';
import 'widgets/result_screen.dart';


class QuizAppScreen extends StatefulWidget {
  const QuizAppScreen({super.key});

  @override
  State<QuizAppScreen> createState() => _QuizAppScreenState();
}

class _QuizAppScreenState extends State<QuizAppScreen> {
  // State variables to manage the quiz logic
  int _questionIndex = 0;
  int _score = 0;
  List<String> _selectedAnswers = []; // To keep track of answers

  // Method to handle when an answer is selected
  void _answerQuestion(String selectedAnswer) {
    // 1. Check if the answer is correct and update the score
    if (questions[_questionIndex]['answer'] == selectedAnswer) {
      _score++;
    }

    // Store the selected answer
    _selectedAnswers.add(selectedAnswer);

    // 2. Move to the next question
    setState(() {
      _questionIndex++;
    });
  }

  // Method to restart the quiz
  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      _selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine which screen to show
    Widget currentScreen;

    if (_questionIndex < questions.length) {
      // Show the Question Screen
      currentScreen = QuestionScreen(
        questionData: questions[_questionIndex],
        questionNumber: _questionIndex + 1,
        totalQuestions: questions.length,
        onAnswerSelected: _answerQuestion,
      );
    } else {
      // Show the Result Screen
      currentScreen = ResultScreen(
        score: _score,
        totalQuestions: questions.length,
        onRestart: _restartQuiz,
      );
    }

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text('Flutter Quiz!!'),
        // backgroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          // Background for the quiz area
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     Theme.of(context).colorScheme.primary.withOpacity(0.8),
            //     Theme.of(context).colorScheme.secondary,
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
          ),
          child: currentScreen, // Display the current screen (Question or Result)
        ),
      ),
    );
  }
}