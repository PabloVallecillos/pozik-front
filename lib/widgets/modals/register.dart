import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pozik_front/utils/info_plus/package.dart';
import 'package:pozik_front/utils/material/messenger_service.dart';

import '../../config/colors.dart';
import '../../repositories/user.dart';
import '../../utils/extensions/string.dart';
import '../../utils/http/dio.dart';
import '../../utils/info_plus/device.dart';
import '../../utils/validation/rules.dart';
import '../buttons/glassmorphism_button.dart';
import '../text_form_fields/email.dart';
import '../text_form_fields/password.dart';
import 'bottom_sheet.dart';

class ModalRegister extends StatefulWidget {

  const ModalRegister({super.key});

  @override
  State<ModalRegister> createState() => _ModalRegisterState();
}

class _ModalRegisterState extends State<ModalRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String? _name;
  late String? _surname;
  late String? _mail;
  String? _password = '';
  String? _passwordCopy = '';
  bool _loading = false;
  String? _errorMessages;

  Future<void> _handleRegister() async
  {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      final UserRepository userRepository = UserRepository();
      setState(() {
        _loading = true;
      });
      try {
        final Response<dynamic> res = await userRepository.register(<String, String>{
          'name': _name!,
          'surname': _surname!,
          'email': _mail!,
          'password': _password!,
          'password_copy': _passwordCopy!,
          'front_version': await getVersion(),
          'platform': getPlatform(),
          'device': await getDevice()
        });
        if (!context.mounted) {
          return;
        }
        Navigator.of(context).pop();
        showSnackBar('Bienvenido, recibirá un email para confirmar su correo', position: Position.up, context: context);
      } on DioException catch (e) {
        String errorMessages = 'Ha ocurrido un error inesperado, vuelva a intentarlo más tarde';
        if (e.response?.statusCode == HttpStatus.unprocessableEntity) {
          errorMessages = DioClient.getResponseErrors(e.response?.data);
        }
        setState(() {
          _errorMessages = errorMessages;
        });
      } finally {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double contextHeight = MediaQuery.of(context).size.height;

    double height = 0;
    if (keyboardHeight != 0) {
      height = contextHeight - 24;
    } else {
      height = contextHeight / 1.5;
    }

    return ModalBottomSheet(
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Form(
          key: _formKey,
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: contextHeight - keyboardHeight - 80,
              child: ListView(
                children: <Widget>[
                  const SizedBox(height: 5,),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                    ),
                    onSaved: (String? val) {
                      _name = val;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).is_required(
                          AppLocalizations.of(context).name.capitalize(),
                          AppLocalizations.of(context).required_male
                        );
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Apellidos',
                    ),
                    onSaved: (String? val) {
                      _surname = val;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).is_required(
                          AppLocalizations.of(context).surname.capitalize(),
                          AppLocalizations.of(context).required_male
                        );
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  EmailTextFormField(
                    onSaved: (String? val) {
                      _mail = val;
                    },
                  ),
                  const SizedBox(height: 20,),
                  PasswordTextFormField(
                    onSaved: (String? val) {
                      setState(() {
                        _password = val;
                      });
                    },
                    onChanged: (String? val) {
                      setState(() {
                        _password = val;
                      });
                    },
                    validator: (String? value) => passwordRule(value, context),
                  ),
                  const SizedBox(height: 20,),
                  PasswordTextFormField(
                    labelText: 'Confirmar contraseña',
                    onSaved: (String? val) {
                      setState(() {
                        _passwordCopy = val;
                      });
                    },
                    validator: (String? value) => passwordCopyRule(_password ?? '', value ?? '', context),
                  ),
                  const SizedBox(height: 20,),
                  GlassmorphismButton(
                    onPressed: _handleRegister,
                    text: !_loading ? 'Registrarse' : const CircularProgressIndicator()
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
        ),
      ),
    );
  }
}
