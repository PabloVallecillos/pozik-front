import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pozik_front/widgets/modals/register.dart';
import 'package:story/story_page_view.dart';
import 'package:video_player/video_player.dart';

import '../config/icons.dart';
import '../utils/material/gradient.dart';
import '../widgets/buttons/glassmorphism_button.dart';
import '../widgets/containers/glass_morphism.dart';
import '../widgets/modals/login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final ValueNotifier<IndicatorAnimationCommand> _indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(IndicatorAnimationCommand.resume);
  List<Widget> _stories = <Widget>[];
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/mp4/welcome_back.mp4');
    _initializeVideoPlayerFuture = _videoController.initialize();
    _videoController.setLooping(true);
    _videoController.play();
  }

  @override
  void dispose() {
    _indicatorAnimationController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  Widget baseStory(List<Widget> children) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FutureBuilder<void>(
          future: _initializeVideoPlayerFuture,
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        Container(
          color: Colors.black.withOpacity(.5),
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

  Widget glassmorphismCircle() {
    return Positioned(
      bottom: 4,
      left: 16,
      child: GlassmorphicContainer(
        width: 60,
        height: 60,
        blur: 3,
        linearGradient: linearGradient(),
        borderGradient: borderGradient(),
        border: 0,
        shape: BoxShape.circle,
        borderRadius: const BorderRadius.all(Radius.circular(60)),
      ),
    );
  }

  Widget story1() {
    return baseStory(<Widget>[
      Text(
        'Desarrollando la Psicometría del Futuro',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium,
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
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium,
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
          glassmorphismCircle(),
          SvgPicture.asset(
            faceSmileIcon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 80,
          ),
        ],
      ),
      Text(
        'Personalidad Blanca',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium,
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
          glassmorphismCircle(),
          SvgPicture.asset(
            faceAngryIcon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 80,
          ),
        ],
      ),
      Text(
        'Personalidad Negra',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium,
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
          glassmorphismCircle(),
          SvgPicture.asset(
            brainIcon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 80,
          ),
        ],
      ),
      Text(
        'Evaluación de Salud Mental',
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium,
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
                    _videoController.pause();
                    _indicatorAnimationController.value = IndicatorAnimationCommand.pause;
                  },
                  onLongPressEnd: (LongPressEndDetails details) {
                    _videoController.play();
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
                              child: GlassmorphismButton(
                                text: 'Acceder',
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) => const ModalLogin()
                                  );
                                }
                              ),
                            ),
                            const SizedBox(width: 15,),
                            Expanded(
                              child: GlassmorphismButton(
                                text: 'Registrarse',
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    showDragHandle: true,
                                    builder: (BuildContext context) => const ModalRegister()
                                  );
                                }
                              ),
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
          indicatorDuration: const Duration(seconds: 15),
        ),
      )
    );
  }
}
