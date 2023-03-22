import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustomWidget extends StatelessWidget {
  const TextFormFieldCustomWidget({
    super.key,
    required TextEditingController weightController,
    required String? Function(String?) validator,
    required String label,
  })  : _weightController = weightController,
        _label = label,
        _validator = validator;

  final TextEditingController _weightController;
  final String _label;
  final String? Function(String?) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _weightController,
      validator: _validator,
      decoration: InputDecoration(
        isDense: true,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .8,
        ),
        label: Text(_label),
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      keyboardType: TextInputType.number,
      inputFormatters: [
        CurrencyTextInputFormatter(
          symbol: '',
          locale: 'pt_BR',
          decimalDigits: 2,
          turnOffGrouping: true,
        ),
      ],
    );
  }
}
