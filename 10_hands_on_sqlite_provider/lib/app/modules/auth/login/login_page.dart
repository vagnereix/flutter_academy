import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/notifier/app_listener_notifier.dart';
import '../../../core/ui/messages.dart';
import '../../../core/widgets/input_field.dart';
import '../../../core/widgets/logo.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _focusEmail = FocusNode();

  @override
  void initState() {
    AppListenerNotifier(changeNotifier: context.read<LoginController>()).listen(
      context: context,
      successCallback: (notifier, listener) {
        debugPrint('✅ login realizado com sucesso');
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 25),
                    const Logo(),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            InputField(
                              label: 'E-mail',
                              controller: _emailEC,
                              focusNode: _focusEmail,
                              validator: Validatorless.multiple([
                                Validatorless.required('E-mail obrigatório'),
                                Validatorless.email('E-mail inválido'),
                              ]),
                            ),
                            const SizedBox(height: 20),
                            InputField(
                              label: 'Senha',
                              obscureText: true,
                              controller: _passwordEC,
                              validator: Validatorless.multiple([
                                Validatorless.required('Senha obrigatória'),
                                Validatorless.min(
                                  6,
                                  'Senha deve ter no mínimo 6 caracteres',
                                ),
                              ]),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (_emailEC.text.isEmpty) {
                                      _focusEmail.requestFocus();
                                      Messages.of(context).showError(
                                        'Informe seu e-mail para recuperar a senha',
                                      );
                                    } else {
                                      context
                                          .read<LoginController>()
                                          .forgotPassword(
                                            context,
                                            _emailEC.text,
                                          );
                                    }
                                  },
                                  style: const ButtonStyle(
                                    visualDensity: VisualDensity.compact,
                                    padding: MaterialStatePropertyAll(
                                      EdgeInsets.zero,
                                    ),
                                  ),
                                  child: const Text('Esqueceu a senha?'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<LoginController>().login(
                                            _emailEC.text,
                                            _passwordEC.text,
                                          );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text('Login'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0XFFF0F3F7),
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey.withAlpha(50),
                              width: 2,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            SignInButton(
                              Buttons.Google,
                              onPressed: () {
                                context
                                    .read<LoginController>()
                                    .signInWithGoogle();
                              },
                              text: 'Continuar com o Google',
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Não tem uma conta?'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('/register');
                                  },
                                  style: const ButtonStyle(
                                    visualDensity: VisualDensity.compact,
                                  ),
                                  child: const Text('Cadastre-se'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
