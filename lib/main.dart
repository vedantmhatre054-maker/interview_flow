import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const InterviewFlowApp());
}

class InterviewFlowApp extends StatelessWidget {
  const InterviewFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InterviewFlow',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const HomeScreen(),
    );
  }
}