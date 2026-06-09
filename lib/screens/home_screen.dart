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

  int getCompletedTopics() {
    int count = 0;

    for (var subject in subjects) {
      count += subject.completed.where((e) => e).length;
    }

    return count;
  }

  int getTotalTopics() {
    int count = 0;

    for (var subject in subjects) {
      count += subject.topics.length;
    }

    return count;
  }

  @override
  Widget build(BuildContext context) {
    double overall = calculateOverallProgress();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text(
          "InterviewFlow",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.deepPurple.shade50,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Overall Progress",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: overall / 100,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${overall.toStringAsFixed(0)}%",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Completed Topics: ${getCompletedTopics()}",
                    ),
                    Text(
                      "Remaining Topics: ${getTotalTopics() - getCompletedTopics()}",
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