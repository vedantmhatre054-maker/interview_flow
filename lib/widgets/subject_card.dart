import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;
  final VoidCallback onTap;

  const SubjectCard({
    super.key,
    required this.subject,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    int completedCount =
        subject.completed.where((item) => item).length;

    return Card(
      color: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(
          subject.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$completedCount / ${subject.topics.length} Topics Completed",
            ),
            const SizedBox(height: 5),
            LinearProgressIndicator(
              value: subject.progress / 100,
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.deepPurple,
        ),
        onTap: onTap,
      ),
    );
  }
}