import 'package:application/blocs/abstracts/runner/runner_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/failures/abstracts/failure.dart';
import 'package:domain/services/todo_service.dart';

class TodoListCubit extends RunnerCubit<void, void> {
  TodoListCubit({required TodoService todoService})
      : _todoService = todoService;
  final TodoService _todoService;
  @override
  Future<Either<Failure, void>> onRun({params}) => _todoService.getListOfTask();
}
