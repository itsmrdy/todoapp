import 'package:application/blocs/abstracts/runner/runner_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/todo/todo_collection.dart';
import 'package:domain/failures/abstracts/failure.dart';
import 'package:domain/services/todo_service.dart';

class TodoCreateCubit extends RunnerCubit<TodoCollectionParams, void> {
  TodoCreateCubit({required TodoService todoService})
      : _todoService = todoService;

  final TodoService _todoService;

  @override
  Future<Either<Failure, void>> onRun({
    required TodoCollectionParams params,
  }) =>
      _todoService.createTask(
          todoCollection: TodoCollection(
        title: params.title,
        description: params.description,
        date: params.date,
      ));
}

class TodoCollectionParams {
  final String? title;
  final String? description;
  final String? date;

  TodoCollectionParams({
    required this.title,
    required this.description,
    required this.date,
  });
}
