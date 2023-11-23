import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/notifier/app_listener_notifier.dart';
import '../../../core/ui/theme_extension.dart';
import '../../../core/widgets/input_field.dart';
import '../../../core/widgets/logo.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void initState() {
    final appListener = AppListenerNotifier(
      changeNotifier: context.read<RegisterController>(),
    );

    appListener.listen(
      context: context,
      successCallback: (notifier, listener) {
        debugPrint('✅ ~ account created');
      },
      errorCallback: (changeNotifier, appListenerNotifier) => debugPrint(
        '🐞 ~ sign in error',
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: context.primaryColor),
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
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.5,
            child: const FittedBox(
              fit: BoxFit.fitHeight,
              child: Logo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InputField(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Email is required'),
                      Validatorless.email('Invalid email'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    controller: _passwordEC,
                    label: 'Password',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Password is required'),
                      Validatorless.min(
                          6, 'Password must be at least 6 digits'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    controller: _confirmPasswordEC,
                    label: 'Confirm password',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Password is required'),
                      Validatorless.min(
                          6, 'Password must be at least 6 digits'),
                      Validatorless.compare(
                          _passwordEC, 'Passwords must be the same'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<RegisterController>()
                              .registerUser(_emailEC.text, _passwordEC.text);
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
