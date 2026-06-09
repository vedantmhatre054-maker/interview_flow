import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectScreen extends StatefulWidget {
  final Subject subject;

  const SubjectScreen({
    super.key,
    required this.subject,
  });

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text(
          widget.subject.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: LinearProgressIndicator(
              value: widget.subject.progress / 100,
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            "${widget.subject.progress.toStringAsFixed(0)}% Completed",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: widget.subject.topics.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  elevation: 3,
                  child: CheckboxListTile(
                    title: Text(
                      widget.subject.topics[index],
                    ),
                    value: widget.subject.completed[index],
                    activeColor: Colors.deepPurple,
                    onChanged: (value) {
                      setState(() {
                        widget.subject.completed[index] = value!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}