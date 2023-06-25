import 'package:default_state_manager/pages/imc_change_notifier/imc_change_notifier_controller.dart';
import 'package:default_state_manager/widgets/bottom_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/radial_gauge_widget.dart';
import '../../widgets/text_form_field_custom_widget.dart';

class ImcChangeNotifierPage extends StatefulWidget {
  const ImcChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ImcChangeNotifierPage> createState() => _ImcChangeNotifierPageState();
}

class _ImcChangeNotifierPageState extends State<ImcChangeNotifierPage> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final _pageController = ImcChangeNotifierController();

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC with ChangeNotifier'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) => RadialGaugeWidget(
                    imc: _pageController.imc ?? 0,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormFieldCustomWidget(
                      weightController: _weightController,
                      label: 'Qual o seu peso atual?',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo não pode ser nulo';
                        }
                        return null;
                      },
                    ),
                    Text(
                      'kg',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormFieldCustomWidget(
                      weightController: _heightController,
                      label: 'Qual sua altura?',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo não pode ser nulo';
                        }
                        return null;
                      },
                    ),
                    Text(
                      'cm',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomButtonsWidget(
        onPressed: () {
          final isFormValid = formKey.currentState?.validate() ?? false;
          if (!isFormValid) return;

          final formatter = NumberFormat.simpleCurrency(
            locale: 'pt_BR',
            decimalDigits: 2,
          );

          final weight = formatter.parse(_weightController.text) as double;
          final height = formatter.parse(_heightController.text) as double;

          _pageController.calculateIMC(weight: weight, height: height);
        },
        label: 'Calcular IMC',
      ),
    );
  }
}
