part of 'injection_container.dart';

/// Registers services to the [serviceLocator].
///
/// All services must be injected via the [GetIt.registerLazySingleton].s
///
/// NOTE: Sort injectables alphabetically.
Future<void> injectServices(GetIt serviceLocator) async {
  // AAA
  // Always explicitly state the generic type in service locator
  // Always explicitly state the generic type in service locator
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
  // SSS
  // TTT
  serviceLocator.registerLazySingleton<TodoService>(
    () => TodoServiceImpl(
      todoApiFeature: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<TodoApiFeature>(
    () => TodoApiFeature(),
  );
  // UUU
  // VVV
  // WWW
  // XXX
  // YYY
  // ZZZ
}
