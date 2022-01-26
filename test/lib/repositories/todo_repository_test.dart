import 'package:diynner_alt/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final repository = TodoRepository();
  test('deve trazer uma lista TodoModel', () async {
    final list = await repository.fetchTodos();
    print(list[0].name);
  });
}
