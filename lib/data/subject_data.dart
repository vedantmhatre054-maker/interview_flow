import '../models/subject.dart';

List<Subject> subjects = [
  Subject(
    name: "DSA",
    topics: [
      "Arrays",
      "Strings",
      "Linked List",
      "Stack",
      "Queue",
      "Trees"
    ],
    completed: List.filled(6, false),
  ),

  Subject(
    name: "Java",
    topics: [
      "OOP",
      "Collections",
      "Exception Handling",
      "File Handling",
      "Streams"
    ],
    completed: List.filled(5, false),
  ),

  Subject(
    name: "DBMS",
    topics: [
      "ER Model",
      "Normalization",
      "SQL",
      "Transactions"
    ],
    completed: List.filled(4, false),
  ),

  Subject(
    name: "Operating Systems",
    topics: [
      "Processes",
      "Threads",
      "Scheduling",
      "Deadlocks"
    ],
    completed: List.filled(4, false),
  ),

  Subject(
    name: "Computer Networks",
    topics: [
      "OSI Model",
      "TCP/IP",
      "Routing",
      "Protocols"
    ],
    completed: List.filled(4, false),
  ),
];