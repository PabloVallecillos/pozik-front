import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pozik_front/utils/extensions/string.dart';

String? emailRule(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context).is_required(
      AppLocalizations.of(context).mail.capitalize(),
      AppLocalizations.of(context).required_male
    );
  }
  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
    return AppLocalizations.of(context).incorrect(
      AppLocalizations.of(context).mail.capitalize()
    );
  }
  return null;
}

const int passwordLength = 8;
String? passwordRule(String? value, BuildContext context) {
  if (value != null) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).is_required(
        AppLocalizations.of(context).password.capitalize(),
        AppLocalizations.of(context).required_female
      );
    }
    if (value.length < passwordLength) {
      return AppLocalizations.of(context).password_length(
        passwordLength.toString()
      );
    }
  }
  return null;
}

String? passwordCopyRule(String password, String passwordC, BuildContext context) {
  String? r;
  if (password.isEmpty) {
    r = AppLocalizations.of(context).is_required(
      AppLocalizations.of(context).password,
      AppLocalizations.of(context).required_female
    );
  }
  if (passwordC.isEmpty) {
    r = AppLocalizations.of(context).is_required(
      AppLocalizations.of(context).password_copy,
      AppLocalizations.of(context).required_female
    );
  }
  if (password.length < passwordLength || passwordC.length < passwordLength) {
    r = AppLocalizations.of(context).password_length(
      passwordLength.toString()
    );
  }
  if (password != passwordC) {
    r = AppLocalizations.of(context).passwords_not_match;
  }

  return r;
}
