import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pozik_front/config/colors.dart';
import 'package:pozik_front/widgets/modals/register.dart';
import 'package:story/story_page_view.dart';

import '../config/icons.dart';
import '../widgets/modals/login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final ValueNotifier<IndicatorAnimationCommand> _indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(IndicatorAnimationCommand.resume);
  List<Widget> _stories = <Widget>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _indicatorAnimationController.dispose();
    super.dispose();
  }

  Widget baseStory(List<Widget> children) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: primary.withOpacity(.1),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            key: UniqueKey(),
            mainAxisAlignment: MainAxisAlignment.center,
            children: children.animate().fade(duration: 600.ms).slide(duration: 600.ms)
          )
        )
      ],
    );
  }

  Widget positionedCircle() {
    return Positioned(
      bottom: 4,
      left: 16,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(.3),
        ),
      ),
    );
  }

  Widget story1() {
    return baseStory(<Widget>[
      Text(
        'Desarrollando la Psicometría del Futuro',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: primary
        ),
        textAlign: TextAlign.center,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.black
          ),
          children: <TextSpan>[
            TextSpan(text: 'Evalúa tu estado psicológico con'),
            TextSpan(text: ' IPSA ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'y ayúdanos',)
          ]
        )
      ),
    ]);
  }

  Widget story2() {
    return baseStory(<Widget>[
      Text(
        '¿Cómo funciona IPSA?',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: primary
        ),
        textAlign: TextAlign.center,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.black
          ),
          children: <TextSpan>[
            TextSpan(text: 'IPSA evaluará tu psicología en 3 niveles:'),
          ]
        )
      ),
    ]);
  }

  Widget story3() {
    return baseStory(<Widget>[
      Stack(
        children: [
          positionedCircle(),
          SvgPicture.asset(
            faceSmileIcon,
            colorFilter: const ColorFilter.mode(primary, BlendMode.srcIn),
            width: 80,
          ),
        ],
      ),
      Text(
        'Personalidad Blanca',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: primary
        ),
        textAlign: TextAlign.center,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.black
          ),
          children: <TextSpan>[
            TextSpan(text: 'IPSA evaluará cual es tu personalidad base, es decir, cuál es tu manera de ser habitual'),
          ]
        )
      ),
    ]);
  }

  Widget story4() {
    return baseStory(<Widget>[
      Stack(
        children: <Widget>[
          positionedCircle(),
          SvgPicture.asset(
            faceAngryIcon,
            colorFilter: const ColorFilter.mode(primary, BlendMode.srcIn),
            width: 80,
          ),
        ],
      ),
      Text(
        'Personalidad Negra',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: primary
        ),
        textAlign: TextAlign.center,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.black
          ),
          children: <TextSpan>[
            TextSpan(text: 'IPSA evaluará cuál es tu personalidad patológica, es decir, cómo es tu manera de ser bajo estrés'),
          ]
        )
      ),
    ]);
  }

  Widget story5() {
    return baseStory(<Widget>[
      Stack(
        children: <Widget>[
          positionedCircle(),
          SvgPicture.asset(
            brainIcon,
            colorFilter: const ColorFilter.mode(primary, BlendMode.srcIn),
            width: 80,
          ),
        ],
      ),
      Text(
        'Evaluación de Salud Mental',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: primary
        ),
        textAlign: TextAlign.center,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.black
          ),
          children: <TextSpan>[
            TextSpan(text: 'IPSA evaluará cuál es el estado de tu salud mental y, en caso de necesitarlo, te pondrá en contacto con un psicólogo de manera gratuita'),
          ]
        )
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (_stories.isEmpty) {
      _stories = <Widget>[
        story1(),
        story2(),
        story3(),
        story4(),
        story5(),
      ];
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: StoryPageView(
          itemBuilder: (BuildContext context, int pageIndex, int storyIndex) => _stories[storyIndex],
          indicatorAnimationController: _indicatorAnimationController,
          gestureItemBuilder: (BuildContext context, int pageIndex, int storyIndex) {
            return Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: <Widget>[
                GestureDetector(
                  onLongPress: () {
                    _indicatorAnimationController.value = IndicatorAnimationCommand.pause;
                  },
                  onLongPressEnd: (LongPressEndDetails details) {
                    _indicatorAnimationController.value = IndicatorAnimationCommand.resume;
                  },
                ),
                Positioned(
                  bottom: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    showDragHandle: true,
                                    builder: (BuildContext context) => const ModalLogin()
                                  );
                                },
                                child: Text(
                                  'Acceder',
                                  style: GoogleFonts.montserrat(
                                    color: primary,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ),
                            const SizedBox(width: 15,),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primary
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    showDragHandle: true,
                                    builder: (BuildContext context) => const ModalRegister()
                                  );
                                },
                                child: Text(
                                  'Registrarse',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          pageLength: _stories.length,
          storyLength: (int pageIndex) => _stories.length,
          indicatorVisitedColor: primary,
          indicatorUnvisitedColor: Colors.white,
          indicatorDuration: const Duration(seconds: 15),
        ),
      )
    );
  }
}
