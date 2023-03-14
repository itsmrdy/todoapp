import 'package:application/blocs/local/todo/todo_create_cubit.dart';
import 'package:application/blocs/local/todo/todo_list_cubit.dart';
import 'package:application/blocs/local/todo/todo_watch_cubit.dart';
import 'package:core/service_locator.dart';
import 'package:domain/services/todo_service.dart';
import 'package:get_it/get_it.dart';
import 'package:service/data/todo_api/todo_api_feature.dart';
import 'package:service/services/implementations/todo_service_impl.dart';

part 'application_injectables.dart';
part 'core_injectables.dart';
part 'dependency_injectables.dart';
part 'service_injectables.dart';

Future<void> initialize() async {
  await Future.wait([
    injectServices(serviceLocator),
    injectionApplications(serviceLocator),
    injectCore(serviceLocator),
    injectDependencies(serviceLocator),
  ]);
}
