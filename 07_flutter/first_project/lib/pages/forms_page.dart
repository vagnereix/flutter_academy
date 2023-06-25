import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final fieldEdintingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    fieldEdintingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: fieldEdintingController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Should not be empty';
                          }

                          // Quando a validação estiver OK retornamos null
                          return null;
                        },
                        maxLines: null,
                        decoration: InputDecoration(
                          isDense: true,
                          label: const Text('Text form field'),
                          // Label quando o campo não tem foco
                          labelStyle: TextStyle(
                            color: Colors.blue.shade900,
                          ),
                          // Label quando o campo está focado
                          floatingLabelStyle: TextStyle(
                            color: Colors.green.shade900,
                          ),
                          // Formato da borda para desenhar ao redor do decoration container
                          border: const OutlineInputBorder(),
                          // Borda exibida quando o campo está habilitado e sem erros
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          // Borda exibida quando o campo está focado e sem erros
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          // Borda exibida quando o campo está focado e mostrando um erro
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade900),
                          ),
                          // Borda exibida quando o campo não está focado e mostrando um erro
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                          // Borda exibida quando o campo está desabilitado
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        enabled: true,
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      DropdownButtonFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Choose one option';
                          }

                          return null;
                        },
                        items: const [
                          DropdownMenuItem(
                            value: '1',
                            child: Text('Barzinho'),
                          ),
                          DropdownMenuItem(
                            value: '2',
                            child: Text('Festão'),
                          ),
                          DropdownMenuItem(
                            value: '3',
                            child: Text('Niver'),
                          ),
                        ],
                        onChanged: (value) {
                          debugPrint('Valor selecionado: $value');
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                          label: Text('Choose one option'),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final formValid =
                              formKey.currentState?.validate() ?? false;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                formValid
                                    ? 'Form validated succeffully: ${fieldEdintingController.text}'
                                    : 'Please complete all text fields',
                              ),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              ),
                            ),
                          );
                        },
                        child: const Text('Save changes'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
