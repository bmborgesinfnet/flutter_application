import 'dart:convert';
import 'package:flutter_application_1/models/task.dart';
import 'package:flutter_application_1/repositories/tasks_repository.dart';
import 'package:http/http.dart';

class TasksService {
  final TasksRepository _tasksRepository = TasksRepository();

  Future<List<Task>> list() async {
    try {
      Response response = await _tasksRepository.list();
      Map<String, dynamic> json = jsonDecode(response.body);
      return Task.listFromJson(json);
    } catch (err) {
      throw Exception("Problemas ao consultar lista.");
    }
  }

  Future<String> insert(Task task) async {
    try {
      String json = jsonEncode(task.toJson());
      Response response = await _tasksRepository.insert(json);
      return jsonDecode(response.body) as String;
    } catch (err) {
      throw Exception("Problemas ao inserir a tarefa.");
    }
  }

  Future<bool> delete(String id) async {
    try {
      Response response = await _tasksRepository.delete(id);
      return response.statusCode == 200;
    } catch (err) {
      throw Exception("Problemas ao excluir a tarefa.");
    }
  }
}