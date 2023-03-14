import 'package:dartz/dartz.dart';
import 'package:domain/entities/todo/todo_collection.dart';
import 'package:domain/failures/abstracts/failure.dart';

abstract class TodoService {
  const TodoService();

  ///[TodoCollection] information of your todo
  ///such as [description] [date] [task name]
  Future<Either<Failure, void>> createTask(
      {required TodoCollection todoCollection});

  ///[TodoCollection] delete your selected task using [TaskID]
  Future<Either<Failure, void>> deleteTask({required int taskId});

  ///[TodoCollection] manage or edit your selected task
  Future<Either<Failure, void>> manageTask(
      {required TodoCollection todoCollection});

  ///[TodoCollection] get list of task that user was created
  Future<Either<Failure, List<TodoCollection>>> getListOfTask();

  ///Listen to changes added by user using stream
  Future<Either<Failure, Stream<List<TodoCollection?>>>> watchaAddedTask();
}
