import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/task_list.dart';
import 'package:flutter_application_1/providers/tasks_provider.dart';
import 'package:flutter_application_1/routes/route_paths.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});
  
  @override
  State<TaskListScreen> createState() => _TaskListScreenState();

}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => TasksProvider(),
        child: const Column(
          children: [
            TaskList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        splashColor: Colors.orangeAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            RoutePaths.INSERTSCREEN
          );
        }
        ),
    );
  }

}