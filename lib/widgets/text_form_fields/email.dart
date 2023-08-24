import 'package:flutter/material.dart';

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
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: onSaved,
      validator: (String? value) => emailRule(value, context),
    );
  }
}
