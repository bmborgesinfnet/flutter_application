import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/tasks_service.dart';

import '../models/task.dart';

class TasksProvider with ChangeNotifier {
  List<Task> itens = [];

  Future<List<Task>> list() async {
    if (itens.isEmpty) {
      // itens = await TasksService.list();
    }
    return itens;
  }

  void addItem(Task task) {
      // task.quant++;
      notifyListeners();
  }

  void removeItem(Task task) {
    
  }


  void deleteItem(Task task) async {
    // bool isDeleted = await TasksService.delete(task.id);
    // if (isDeleted) {
    //    itens.remove(task);
    //    notifyListeners();
    // }
  }
}