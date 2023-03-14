import 'package:application/blocs/abstracts/watcher/watcher_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/entities/todo/todo_collection.dart';
import 'package:domain/failures/abstracts/failure.dart';
import 'package:domain/services/todo_service.dart';

class TodoWatchCubit extends WatcherCubit<List<TodoCollection?>> {
  TodoWatchCubit({required TodoService todoService})
      : _todoService = todoService;

  final TodoService _todoService;

  @override
  Future<Either<Failure, Stream<List<TodoCollection?>>>> onWatch() =>
      _todoService.watchaAddedTask();
}
