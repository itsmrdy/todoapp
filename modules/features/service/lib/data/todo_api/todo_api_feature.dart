import 'package:dartz/dartz.dart';
import 'package:domain/failures/abstracts/failure.dart';
import 'package:service/data/models/todo_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoApiFeature {
  Future<List<TodoApiModel>> getListOftask() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    final List<String>? _todoList = await _sharedPref.getStringList('todo');

    if (_todoList!.isNotEmpty) {
      return List.generate(
        _todoList.length,
        (index) => TodoApiModel.fromJson(
          _todoList[index],
        ),
      );
    }
    return [];
  }

  Future<Either<Failure, void>> createTask(
      {required TodoApiModel todoApiModel}) async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();

    if (!_sharedPref.containsKey('todo')) {
      _sharedPref.setStringList('todo', []);
    }

    final List<String>? _todoList = await _sharedPref.getStringList('todo');
    final _todoApiModel = todoApiModel.toJson();

    _todoList!.add(_todoApiModel);

    final bool _isInserted = await _sharedPref.setStringList('todo', _todoList);

    if (_isInserted) {
      return Right(true);
    }
    return Right(null);
  }

  Future<Either<Failure, void>> deleteTask({required int taskId}) async {
    return Right(null);
  }

  Future<Either<Failure, void>> manageTask(
      {required TodoApiModel todoApiModel}) async {
    return Right(null);
  }
}
