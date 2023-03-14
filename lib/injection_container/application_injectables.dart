part of 'injection_container.dart';

/// Registers Blocs to the [serviceLocator].
///
/// All blocs must be injected via the [GetIt.registerFactory].
///
/// NOTE: Sort injectables alphabetically.
Future<void> injectionApplications(GetIt serviceLocator) async {
  // AAA
  // BBB
  // CCC
  // DDD
  // EEE
  // FFF
  // GGG
  // HHH
  // III
  // JJJ
  // KKK
  // LLL
  // MMM
  // NNN
  // OOO
  // PPP
  // QQQ
  // RRR
  // Always explicitly state the generic type in service locator
  // SSS
  // TTT
  serviceLocator.registerFactory<TodoCreateCubit>(
    () => TodoCreateCubit(
      todoService: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<TodoListCubit>(
    () => TodoListCubit(
      todoService: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<TodoWatchCubit>(
    () => TodoWatchCubit(
      todoService: serviceLocator(),
    ),
  );
  // UUU
  // VVV
  // WWW
  // XXX
  // YYY
  // ZZZ
}
