import 'package:application/blocs/abstracts/runner/runner_cubit.dart';
import 'package:application/blocs/local/todo/todo_create_cubit.dart';
import 'package:core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/pages/todo/todo_page.dart';
import 'package:presentation/routes/named_page_route.dart';
import 'package:presentation/utils/screen_enum.dart';
import 'package:presentation/widgets/global/custom_appbar.dart';
import 'package:presentation/widgets/global/date_picker.dart';
import 'package:presentation/widgets/global/rounded_elevated_button.dart';
import 'package:presentation/widgets/global/rounded_text_field.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate();

  @override
  State<TodoCreate> createState() => _TodoCreatePageState();
}

class _TodoCreatePageState extends State<TodoCreate> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();

  ///[Screen.TODO_CREATE.name] must return a value of Create Task
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: Screen.TODO_CREATE.name,
        ),
        body: BlocProvider(
          create: (context) => serviceLocator<TodoCreateCubit>(),
          child: Builder(builder: (context) {
            return Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: RoundedTextField(
                      controller: _taskNameController,
                      onChanged: (String? value) {},
                      hintText: "Task",
                    )),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: RoundedTextField(
                      controller: _taskDescriptionController,
                      onChanged: (String? value) {},
                      hintText: "Description",
                    )),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: DatePicker(
                    controller: _dateController,
                    hintText: "Date",
                  ),
                ),
                Spacer(),
                BlocConsumer<TodoCreateCubit, RunnerState>(
                    builder: (context, stateBuilder) {
                  return RoundedElevatedButton(
                    buttonText: "Create Task",
                    onPressed: () {
                      BlocProvider.of<TodoCreateCubit>(context)
                        ..run(
                          params: TodoCollectionParams(
                            title: _taskNameController.text,
                            description: _taskDescriptionController.text,
                            date: _dateController.text,
                          ),
                        );
                    },
                  );
                }, listener: (context, listenerState) {
                  if (listenerState is RunnerInitial) {
                    _taskNameController.clear();
                    _taskDescriptionController.clear();
                    _dateController.clear();
                  } else if (listenerState is RunSuccess) {
                    Navigator.of(context).push(
                      NamedPageRoute<TodoPage, dynamic>(
                        builder: (context) => TodoPage(),
                      ),
                    );
                  }
                })
              ],
            );
          }),
        ));
  }
}
