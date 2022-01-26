import 'dart:html';
import 'package:dio/dio.dart';
import 'package:diynner_alt/src/models/todo_model.dart';

class TodoRepository {
  late final Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository(Dio dio) {
    if (dio == null) {
      this.dio = Dio();
    } else {
      this.dio = dio;
    }
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<TodoModel> todos = [];
    for (var json in list) {
      final todo = TodoModel.fromJson(json);
      todos.add(todo);
    }
    return todos;
  }
}
