import 'package:flutter/material.dart';

import '../ui/eye_icons.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconButton? suffixIconButton;
  final ValueNotifier<bool> obscureTextNotifier;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  InputField({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.suffixIconButton,
    this.controller,
    this.validator,
  })  : assert(obscureText == true ? suffixIconButton == null : true,
            'If obscureText is true, suffixIconButton must be null.'),
        obscureTextNotifier = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextNotifier,
      builder: (_, obscureValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureValue,
          decoration: InputDecoration(
            isDense: true,
            labelText: label,
            suffixIcon: suffixIconButton ??
                (obscureText == true
                    ? IconButton(
                        onPressed: () {
                          obscureTextNotifier.value = !obscureValue;
                        },
                        icon: obscureValue
                            ? Icon(
                                EyeIcons.eye,
                                color: Colors.teal.shade300,
                                size: 15,
                              )
                            : Icon(
                                EyeIcons.eye_slash,
                                color: Colors.teal.shade300,
                                size: 15,
                              ),
                      )
                    : null),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
