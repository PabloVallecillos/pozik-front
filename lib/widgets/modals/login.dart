import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pozik_front/repositories/user.dart';
import 'package:pozik_front/utils/http/dio.dart';
import 'package:pozik_front/utils/info_plus/device.dart';
import 'package:pozik_front/utils/storage/token_storage.dart';

import '../../config/colors.dart';
import '../../config/routes.dart';
import '../../utils/validation/rules.dart';
import '../buttons/glassmorphism_button.dart';
import '../text_form_fields/email.dart';
import '../text_form_fields/password.dart';
import 'bottom_sheet.dart';

class ModalLogin extends StatefulWidget {

  const ModalLogin({super.key});

  @override
  State<ModalLogin> createState() => _ModalLoginState();
}

class _ModalLoginState extends State<ModalLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String? _email;
  late String? _password;
  int _validationHeight = 20;
  bool _loading = false;
  String? _errorMessages;

  Future<void> _handleLogin() async
  {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      final UserRepository userRepository = UserRepository();
      setState(() {
        _loading = true;
      });
      try {
        final Response<dynamic> res = await userRepository.login(<String, String>{
          'email': _email!,
          'password': _password!,
          'device': await getDevice(),
        });
        TokenStorage().set(res.data['token']);
        if (!context.mounted) {
          return;
        }
        Navigator.of(context).pushReplacementNamed(dashboardRoute);
      } on DioException catch (e) {
        String errorMessages = 'Ha ocurrido un error inesperado, vuelva a intentarlo más tarde';
        if (e.response?.statusCode == HttpStatus.unprocessableEntity) {
          errorMessages = DioClient.getResponseErrors(e.response?.data);
        }
        setState(() {
          _errorMessages = errorMessages;
          _validationHeight = 55;
        });
      } finally {
        setState(() {
          _loading = false;
        });
      }
    } else {
      setState(() {
        _validationHeight = 70;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double contextHeight = MediaQuery.of(context).size.height;

    double height = 0;
    if (keyboardHeight != 0) {
      height = contextHeight - keyboardHeight + _validationHeight;
    } else {
      height = contextHeight / 3 + _validationHeight;
    }

    return ModalBottomSheet(
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              EmailTextFormField(
                onSaved: (String? val) {
                  _email = val;
                },
              ),
              const SizedBox(height: 20,),
              PasswordTextFormField(
                onSaved: (String? val) {
                  _password = val;
                },
                validator: (String? value) => passwordRule(value, context),
              ),
              const SizedBox(height: 20,),
              GlassmorphismButton(
                onPressed: _handleLogin,
                text: _loading
                  ? const CircularProgressIndicator()
                  : 'Acceder'
              ),
              const SizedBox(height: 20,),
              if (_errorMessages != null)
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    _errorMessages!,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: red,
                      fontWeight: FontWeight.bold
                    )
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
