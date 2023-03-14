import 'package:application/blocs/local/todo/todo_list_cubit.dart';
import 'package:core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/pages/todo/todo_page.dart';
import 'package:presentation/theme/cart_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: cartLightTheme,
        home: MultiBlocProvider(providers: [
          BlocProvider(
            lazy: false,
            create: (context) =>
                serviceLocator<TodoListCubit>()..run(params: null),
          ),
        ], child: TodoPage()));
  }
}
