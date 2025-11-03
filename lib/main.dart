// main.dart

import 'package:flutter/material.dart';
import 'quiz_app.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // Home now points to the widget containing the main quiz logic
      home: const QuizAppScreen(),
    );
  }
}

