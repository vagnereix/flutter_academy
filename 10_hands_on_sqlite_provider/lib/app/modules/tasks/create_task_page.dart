import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/notifier/app_listener_notifier.dart';
import '../../core/ui/theme_extension.dart';
import '../../core/widgets/input_field.dart';
import 'create_task_controller.dart';
import 'widgets/calendar_button.dart';

class CreateTaskPage extends StatefulWidget {
  final CreateTaskController _controller;

  const CreateTaskPage({super.key, required CreateTaskController controller})
      : _controller = controller;

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionEC = TextEditingController();

  @override
  void initState() {
    AppListenerNotifier(changeNotifier: widget._controller).listen(
      context: context,
      successCallback: (changeNotifier, appListenerNotifier) {
        Navigator.of(context).pop();
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _descriptionEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(40),
              padding: const EdgeInsets.all(10),
              child: Icon(
                size: 20,
                Icons.arrow_back_rounded,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create a new task',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              InputField(
                label: 'What do you need to do?',
                controller: _descriptionEC,
                validator: Validatorless.required('Description is required'),
              ),
              const SizedBox(height: 10),
              const CalendarButton(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            widget._controller.createTask(_descriptionEC.text);
          }
        },
        label: const Text(
          'Create',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
