import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/colors.dart';
import '../../config/images.dart';
import '../../config/layout.dart';
import '../../utils/extensions/string.dart';
import '../../utils/validation/rules.dart';
import '../../widgets/sliders/swiper/swiper.dart';
import '../../widgets/sliders/swiper/swiper_controller.dart';
import '../../widgets/text_form_fields/email.dart';
import '../../widgets/text_form_fields/password.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> with TickerProviderStateMixin {
  late AnimationController _linearProgressAnimationController;
  late SwiperController _swiperController;

  @override
  void initState() {
    _linearProgressAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _swiperController = SwiperController();
    super.initState();
  }

  @override
  void dispose() {
    _linearProgressAnimationController.dispose();
    _swiperController.dispose();
    super.dispose();
  }

  WhoAnswer? _groupValue;
  String? _name;
  String? _surname;
  String? _mail;
  String? _password;

  List<Widget> _getCards() => <Widget>[
    Card(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                child: SvgPicture.asset(
                  personalityImg,
                  width: 150,
                ),
              ),
              const SizedBox(height: 10,),
              TitleLarge('Test de Personalidad'),
              TitleMedium('Preguntas Previas'),
              const SizedBox(height: 10,),
              TitleSmall('¿Contestas este Test para ti o para otra persona?'),
              const SizedBox(height: 10,),
              Option<WhoAnswer>(
                'Para mí',
                value: WhoAnswer.forMe,
                groupValue: _groupValue,
                onChanged: (WhoAnswer? value) {
                  setState(() {
                    _groupValue = value;
                  });
                  _swiperController.next();
                },
              ),
              const SizedBox(height: 10,),
              Option<WhoAnswer>(
                'Para otra persona',
                value: WhoAnswer.forSomeoneElse,
                groupValue: _groupValue,
                onChanged: (WhoAnswer? value) {
                  setState(() {
                    _groupValue = value;
                  });
                },
              ),
              const SizedBox(height: 10,),
              TitleSmall('¿A quién le quieres hacer el Test?'),
              const SizedBox(height: 10,),
              Text(
                'Elige a una de las personas a quien le quieras hacer el estudio del listado de personas de abajo. Si la persona no está presente, inserta los datos que se solicitan a continuación y le generaremos un usuario en la plataforma de Pozik para que pueda consultar sus resultados.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
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
              const SizedBox(height: 10,),
              const SizedBox(height: 5,),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold
                  )
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
                  labelStyle: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold
                  )
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
            ],
          ),
        ),
      ),
    ),
    Card(
      child: const Text('2'),
    ),
    Card(
      child: const Text('3'),
    ),
    Card(
      child: const Text('4'),
    ),
    Card(
      child: const Text('5'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      body: Column(
        children: <Widget>[
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    print('asdf');
                  },
                  icon: Icon(Icons.arrow_back_outlined, color: primary,)
                ),
                const SizedBox(width: 150,),
                Expanded(
                  child: ClipRRect(
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
                ),
              ],
            ),
          ),
          Expanded(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return _getCards()[index];
              },
              loop: false,
              controller: _swiperController,
              onIndexChanged: (int index) {
                if (index == _getCards().length - 1) {
                  setState(() {
                    _linearProgressAnimationController.animateTo(1.0);
                  });
                } else {
                  final double progress = index / (_getCards().length - 1);
                  setState(() {
                    _linearProgressAnimationController.animateTo(progress);
                  });
                }
              },
              itemCount: _getCards().length,
              itemWidth: MediaQuery.of(context).size.width - 50,
              itemHeight: MediaQuery.of(context).size.height - 125,
              layout: SwiperLayout.TINDER,
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
