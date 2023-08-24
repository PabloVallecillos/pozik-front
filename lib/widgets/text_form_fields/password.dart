import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final FormFieldSetter<String?>? onSaved;
  final FormFieldSetter<String?>? onChanged;
  final String? labelText;
  final FormFieldValidator<String?>? validator;

  const PasswordTextFormField({
    super.key,
    this.onSaved,
    this.onChanged,
    this.labelText,
    this.validator
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        labelText: widget.labelText ?? 'Contraseña',
        suffixIcon: IconButton(
          icon: Icon(
            !_passwordVisible
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      enableSuggestions: false,
      autocorrect: false,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
    );
  }
}
