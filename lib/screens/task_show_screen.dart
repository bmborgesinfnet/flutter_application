import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';

class TaskShowScreen extends StatelessWidget {
  const TaskShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var arg =
    Task task = ModalRoute.of(context)?.settings.arguments as Task;

    return Scaffold(
      appBar: AppBar(
        title: Text(task.description),
      ),
      body: Column(
        children: [
          Text(task.location, 
            style: TextStyle(
              fontSize: 30.0
            ),)
        ],
      ),
    );
  }
}