import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';
import 'package:flutter_application_1/providers/tasks_provider.dart';
import 'package:provider/provider.dart';
import '../routes/route_paths.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem(
    this.task, {
    super.key,
  });

  final Task task;

  
  @override
  Widget build(BuildContext context) {
    final _tasks = Provider.of<TasksProvider>(context);
    return ListTile(
      leading: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => _tasks.removeItem(task),
      ),
      title: Text(task.description),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () => _tasks.addItem(task),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(RoutePaths.SHOWSCREEN, arguments: task);
        // Navigator.of(context)
        // .p
      },
    );
  }
}