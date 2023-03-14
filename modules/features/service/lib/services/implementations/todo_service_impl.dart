// ignore_for_file: unused_field
import 'package:domain/failures/abstracts/failure.dart';
import 'package:domain/entities/todo/todo_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/services/todo_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:service/data/models/todo_api_model.dart';
import 'package:service/data/todo_api/todo_api_feature.dart';

class TodoServiceImpl implements TodoService {
  TodoServiceImpl({
    required TodoApiFeature todoApiFeature,
  }) : _todoApiFeature = todoApiFeature;

  final TodoApiFeature _todoApiFeature;

  final _todoListStream = BehaviorSubject<List<TodoCollection?>>();

  void _emitNewTask(List<TodoCollection?> newTask) {
    _todoListStream.add(newTask);
  }

  @override
  Future<Either<Failure, void>> createTask(
      {required TodoCollection todoCollection}) async {
    final response = await _todoApiFeature.createTask(
        todoApiModel: TodoApiModel(
      id: todoCollection.id,
      taskName: todoCollection.title,
      description: todoCollection.description,
      date: todoCollection.date,
    ));

    ///Retrieve list of task
    getListOfTask();
    return response;
  }

  @override
  Future<Either<Failure, void>> deleteTask({required int taskId}) async {
    return _todoApiFeature.deleteTask(taskId: taskId);
  }

  @override
  Future<Either<Failure, List<TodoCollection>>> getListOfTask() async {
    final response = await _todoApiFeature.getListOftask();

    final List<TodoCollection> _todoCollection;

    _todoCollection = List.generate(
      response.length,
      (index) => TodoCollection(
        title: response[index].taskName,
        description: response[index].description,
        date: response[index].date,
        id: response[index].id,
      ),
    );

    _emitNewTask(_todoCollection);

    return Right(_todoCollection);
  }

  @override
  Future<Either<Failure, Stream<List<TodoCollection?>>>>
      watchaAddedTask() async => Right(_todoListStream);

  @override
  Future<Either<Failure, void>> manageTask(
      {required TodoCollection todoCollection}) async {
    return _todoApiFeature.manageTask(
      todoApiModel: TodoApiModel(
        id: todoCollection.id,
        taskName: todoCollection.title,
        description: todoCollection.description,
        date: todoCollection.date,
      ),
    );
  }
}
