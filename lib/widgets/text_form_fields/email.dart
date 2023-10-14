import 'package:flutter/material.dart';
import 'package:pozik_front/config/colors.dart';

import '../../utils/validation/rules.dart';

class EmailTextFormField extends StatelessWidget {
  final FormFieldSetter<String?>? onSaved;

  const EmailTextFormField({
    super.key,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: onSaved,
      validator: (String? value) => emailRule(value, context),
    );
  }
}
