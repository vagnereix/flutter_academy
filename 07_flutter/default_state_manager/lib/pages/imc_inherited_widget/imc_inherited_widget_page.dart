import 'package:default_state_manager/widgets/bottom_buttons_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/radial_gauge_widget.dart';
import 'imc_inherited_widget.dart';

class ImcInheritedWidgetPage extends StatefulWidget {
  const ImcInheritedWidgetPage({Key? key}) : super(key: key);

  @override
  State<ImcInheritedWidgetPage> createState() => _ImcInheritedWidgetPageState();
}

class _ImcInheritedWidgetPageState extends State<ImcInheritedWidgetPage> {
  @override
  Widget build(BuildContext context) {
    final imcInheritedWidget = ImcInheritedWidget.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC with InheritedWidget'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadialGaugeWidget(imc: imcInheritedWidget.imc),
              const SizedBox(height: 24),
              const Text(
                'Esse IMC está vindo de uma Inherited Widget, estamos buscando dentro do BuildContext uma instância de ImcInheritedWidget e utilizando o valor do IMC definido na mesma.',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomButtonsWidget(
        onPressed: () => Navigator.pop(context),
        label: 'OK',
      ),
    );
  }
}
