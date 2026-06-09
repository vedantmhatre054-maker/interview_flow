import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectScreen extends StatefulWidget {
  final Subject subject;

  const SubjectScreen({super.key, required this.subject});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text(
        widget.subject.name,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Column(
        children: [
            Padding(
            padding: const EdgeInsets.all(16),
            child: LinearProgressIndicator(
                value: widget.subject.progress / 100,
            ),
            ),

            Text(
            "${widget.subject.progress.toStringAsFixed(0)}% Completed",
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
            ),
            ),

            Expanded(
            child: ListView.builder(
                itemCount: widget.subject.topics.length,
                itemBuilder: (context, index) {
                return CheckboxListTile(
                    title: Text(widget.subject.topics[index]),
                    value: widget.subject.completed[index],
                    onChanged: (value) {
                    setState(() {
                        widget.subject.completed[index] = value!;
                    });
                    },
                );
               },
            ),
           ),
        ],
      ),
    ); 
  }
}