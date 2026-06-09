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
        title: Text(widget.subject.name),
      ),
      body: ListView.builder(
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
    );
  }
}