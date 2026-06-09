class Subject {
  String name;
  List<String> topics;
  List<bool> completed;

  Subject({
    required this.name,
    required this.topics,
    required this.completed,
  });

  double get progress {
    int done = completed.where((item) => item).length;
    return topics.isEmpty ? 0 : (done / topics.length) * 100;
  }
}