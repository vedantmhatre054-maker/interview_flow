import 'package:flutter/material.dart';
import '../data/subject_data.dart';
import '../widgets/subject_card.dart';
import 'subject_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double calculateOverallProgress() {
    double total = 0;

    for (var subject in subjects) {
      total += subject.progress;
    }

    return total / subjects.length;
  }

  @override
  Widget build(BuildContext context) {
    double overall = calculateOverallProgress();

    return Scaffold(
      appBar: AppBar(
        title: const Text("InterviewFlow"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Overall Progress",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: overall / 100,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${overall.toStringAsFixed(0)}%",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return SubjectCard(
                    subject: subjects[index],
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              SubjectScreen(subject: subjects[index]),
                        ),
                      );

                      setState(() {});
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}