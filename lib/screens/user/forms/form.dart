import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/colors.dart';
import '../../../config/images.dart';
import '../../../config/layout.dart';
import '../../../utils/extensions/string.dart';
import '../../../utils/validation/rules.dart';
import '../../../widgets/text_form_fields/email.dart';
import '../../../widgets/text_form_fields/password.dart';

class FormScreen extends StatefulWidget {
  final String title;
  final String? subtitle;
  final List<String> questions;
  final List<String> answers;

  const FormScreen({
    super.key,
    required this.title,
    this.subtitle,
    required this.questions,
    required this.answers,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with TickerProviderStateMixin {
  late AnimationController _linearProgressAnimationController;
  late PageController _pageViewController;
  int _currentCardIndex = 0;

  @override
  void initState() {
    _linearProgressAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _pageViewController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _linearProgressAnimationController.dispose();
    _pageViewController.dispose();
    super.dispose();
  }

  WhoAnswer? _whoGroupValue;
  String? _whoUserGroupValue;
  final Map<int, Enum?> _answers = <int, Enum?>{};
  String? _name;
  String? _surname;
  String? _mail;
  String? _password;

  Enum? _getAnswerValue(String value) {
    final Map<String, Enum> values = <String, Enum>{
      AppLocalizations.of(context).strongly_disagree: TestAnswer.stronglyDisagree,
      AppLocalizations.of(context).disagree: TestAnswer.disagree,
      AppLocalizations.of(context).neither_agree_nor_disagree: TestAnswer.neitherAgreeNorDisagree,
      AppLocalizations.of(context).agree: TestAnswer.agree,
      AppLocalizations.of(context).strongly_agree: TestAnswer.stronglyAgree,
      AppLocalizations.of(context).yes: ClosedOptions.yes,
      AppLocalizations.of(context).no: ClosedOptions.no,
    };

    return values[value];
  }

  List<Widget> _getCards() => <Widget>[
    FormCard(
      children: <Widget>[
        Align(
          child: SvgPicture.asset(
            personalityImg,
            width: 150,
          ),
        ),
        const SizedBox(height: 10,),
        TitleLarge(widget.title),
          if (widget.subtitle != null)
            TitleSmall(widget.subtitle.toString()),
        const TitleMedium('Preguntas Previas'),
        const SizedBox(height: 10,),
        const TitleSmall('¿Contestas este Test para ti o para otra persona?'),
        const SizedBox(height: 10,),
        Option<WhoAnswer>(
          'Para mí',
          value: WhoAnswer.forMe,
          groupValue: _whoGroupValue,
          onChanged: (WhoAnswer? value) {
            setState(() {
              _whoGroupValue = value;
            });
            _pageViewController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.linear);
          },
        ),
        const SizedBox(height: 10,),
        Option<WhoAnswer>(
          'Para otra persona',
          value: WhoAnswer.forSomeoneElse,
          groupValue: _whoGroupValue,
          onChanged: (WhoAnswer? value) {
            setState(() {
              _whoGroupValue = value;
            });
          },
        ),
        if (_whoGroupValue == WhoAnswer.forSomeoneElse)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              TitleSmall('¿A quién le quieres hacer el Test?'),
              const SizedBox(height: 10,),
              Text(
                'Elige a una de las personas a quien le quieras hacer el estudio del listado de personas de abajo.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10,),
              Option<String>(
                'TEST TEST - vallecillosdev@gmail.com',
                value: 'vallecillosdev@gmail.com',
                groupValue: _whoUserGroupValue,
                onChanged: (String? value) {
                  setState(() {
                    _whoUserGroupValue = 'vallecillosdev@gmail.com';
                  });
                  _pageViewController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.linear);
                },
              ),
              const SizedBox(height: 10,),
              Option<String>(
                'asdfasdf asdfasdf - vallecillosdev1@gmail.com',
                value: 'vallecillosdev1@gmail.com',
                groupValue: _whoUserGroupValue,
                onChanged: (String? value) {
                  setState(() {
                    _whoUserGroupValue = 'vallecillosdev1@gmail.com';
                  });
                },
              ),
              const SizedBox(height: 10,),
              Text(
                'Si la persona no está presente, inserta los datos que se solicitan a continuación y le generaremos un usuario en la plataforma de Pozik para que pueda consultar sus resultados.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              Form(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 10,),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
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
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: 'Apellidos',
                        ),
                        onSaved: (String? val) {
                          _surname = val;
                        },
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
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
                    ],
                  )
              ),
              const SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black
                  ),
                  children: const <TextSpan>[
                    TextSpan(text: 'Importante: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    TextSpan(text: 'Recuerda apuntar el email y contraseña para que puedas acceder a tu nueva cuenta de Pozik, porque si no no podrás verla.'),
                  ]
                )
              ),
            ],
          ).animate().fade(duration: 600.ms).moveY(duration: 600.ms),
      ],
    ),
    ...widget.questions.asMap().entries.map((MapEntry<int, String> question) => FormCard(
      children: <Widget>[
        const SizedBox(height: 10,),
        TitleMedium(question.value),
        const SizedBox(height: 10,),
        ..._questionOptions(question.key),
      ],
    ))
  ];

  List<Widget> _questionOptions(int number) {
    return widget.answers.map((String answer) {
      return Option<Enum>(
        answer,
        value: _getAnswerValue(answer),
        groupValue: _answers[number],
        onChanged: (Enum? value) {
          setState(() {
            _answers[number] = value;
          });
          _pageViewController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.linear);
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      body: Column(
        children: <Widget>[
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform.translate(
                  offset: const Offset(-10, 0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: primary,),
                    onPressed: () {}
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleMedium(widget.title),
                          TitleMedium('${_currentCardIndex + 1} / ${_getCards().length}'),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(radiusCircular)),
                        child: AnimatedBuilder(
                          animation: _linearProgressAnimationController,
                          builder: (BuildContext context, Widget? child) {
                            return LinearProgressIndicator(
                              value: _linearProgressAnimationController.value,
                              backgroundColor: Colors.white,
                              valueColor: const AlwaysStoppedAnimation<Color>(primary),
                            );
                          },
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              padEnds: false,
              controller: _pageViewController,
              itemBuilder: (BuildContext context, int index) {
                return _getCards()[index];
              },
              onPageChanged: (int index) {
                if (index == _getCards().length - 1) {
                  setState(() {
                    _linearProgressAnimationController.animateTo(1.0, duration: const Duration(milliseconds: 200));
                    _currentCardIndex = index;
                  });
                } else {
                  final double progress = index / (_getCards().length - 1);
                  setState(() {
                    _linearProgressAnimationController.animateTo(progress, duration: const Duration(milliseconds: 200));
                    _currentCardIndex = index;
                  });
                }
              },
            )
          )
        ],
      )
    );
  }
}

enum ClosedOptions {
  yes,
  no
}

enum WhoAnswer {
  forMe,
  forSomeoneElse
}

enum TestAnswer {
  stronglyDisagree,
  disagree,
  neitherAgreeNorDisagree,
  agree,
  stronglyAgree,
}

class TitleMedium extends StatelessWidget {
  final String text;

  const TitleMedium(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class TitleLarge extends StatelessWidget {
  final String text;

  const TitleLarge(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: Colors.black,
      ),
    );
  }
}

class TitleSmall extends StatelessWidget {
  final String text;

  const TitleSmall(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class Option<T> extends StatelessWidget {
  final String text;
  final dynamic value;
  final dynamic groupValue;
  final ValueChanged<T?>? onChanged;

  const Option(
    this.text,
    {
      super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: RadioListTile<T>(
        tileColor: primaryLight,
        contentPadding: const EdgeInsets.only(left: 5),
        title: Transform.translate(offset: const Offset(-14,0), child: Text(text, style: const TextStyle(color: Colors.black),)),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged
      )
    );
  }
}

class FormCard extends StatelessWidget {
  final List<Widget> children;

  const FormCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 20),
      child: Card(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
