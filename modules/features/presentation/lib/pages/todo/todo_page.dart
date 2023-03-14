import 'package:application/blocs/abstracts/runner/runner_cubit.dart';
import 'package:application/blocs/abstracts/watcher/watcher_cubit.dart';
import 'package:application/blocs/local/todo/todo_list_cubit.dart';
import 'package:application/blocs/local/todo/todo_watch_cubit.dart';
import 'package:core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/pages/todo/todo_create.dart';
import 'package:presentation/routes/named_page_route.dart';
import 'package:presentation/utils/screen_enum.dart';
import 'package:presentation/widgets/global/card_widget.dart';
import 'package:presentation/widgets/global/custom_appbar.dart';

class TodoPage extends StatefulWidget {
  const TodoPage();
  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  ///[Screen.TODO_LIST.name] must return a value of My Todos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Screen.TODO_LIST.name,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              NamedPageRoute<TodoCreate, dynamic>(
                builder: (context) => TodoCreate(),
              ),
            );
          },
          child: Icon(Icons.note_add_sharp),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    serviceLocator<TodoListCubit>()..run(params: null)),
            BlocProvider(
              create: (context) => serviceLocator<TodoWatchCubit>()..watch(),
            )
          ],
          child: BlocBuilder<TodoWatchCubit, WatcherState>(
            builder: (context, watcherState) {
              return BlocBuilder<TodoListCubit, RunnerState>(
                  builder: (context, state) {
                if (state is RunnerInitial) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is RunSuccess<void>) {
                  final _collection =
                      BlocProvider.of<TodoWatchCubit>(context).value;
                  return SizedBox.expand(
                      child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _collection!.length,
                    itemBuilder: (context, int index) {
                      return CardWidget(
                        cardHeight: 100,
                        cardText: _collection[index]!.title,
                        cardTrailingText: _collection[index]!.date!,
                        cardSubText: _collection[index]!.description!,
                      );
                    },
                  ));
                }
                return Container(
                  child: Center(
                    child: Text("No task available"),
                  ),
                );
              });
            },
          ),
        ));
  }
}
