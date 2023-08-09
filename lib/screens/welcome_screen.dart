import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pozik_front/config/icons.dart';
import 'package:pozik_front/widgets/glass_morphism.dart';
import 'package:story/story_page_view.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final ValueNotifier<IndicatorAnimationCommand> _indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(IndicatorAnimationCommand.resume);
  List<Widget> _stories = <Widget>[];
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
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
    _counter.dispose();
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
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children
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
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff).withOpacity(0.1),
            Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: [
            0.1,
            1,
          ]
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFffffff).withOpacity(0.5),
            Color((0xFFFFFFFF)).withOpacity(0.5),
          ],
        ),
        border: 0,
        shape: BoxShape.circle,
        borderRadius: 60,
      ),
    );
  }

  List<Widget> story1() {
    return <Widget>[
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
    ];
  }

  List<Widget> story2() {
    return <Widget>[
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
    ];
  }

  List<Widget> story3() {
    return <Widget>[
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
    ];
  }

  List<Widget> story4() {
    return <Widget>[
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
    ];
  }

  List<Widget> story5() {
    return <Widget>[
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
    ];
  }

  Widget glassmorphismButton({required String text, VoidCallback? onPressed}) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width,
      height: 40,
      borderRadius: 30,
      blur: 3,
      border: 0,
      alignment: Alignment.center,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.1),
          Color(0xFFFFFFFF).withOpacity(0.05),
        ],
        stops: [
          0.1,
          1,
        ]
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.5),
          Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size.fromHeight(40),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_stories.isEmpty) {
      _stories = <Widget>[
        baseStory(story1()),
        baseStory(story2()),
        baseStory(story3()),
        baseStory(story4()),
        baseStory(story5()),
      ];
    }

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<int>(
          valueListenable: _counter,
          builder: (BuildContext context, int value, _) {
            return StoryPageView(
              key: ValueKey<int>(value),
              itemBuilder: (BuildContext context, int pageIndex, int storyIndex) {
                final Widget widget = _stories[storyIndex];
                return widget;
              },
              indicatorAnimationController: _indicatorAnimationController,
              gestureItemBuilder: (BuildContext context, int pageIndex, int storyIndex) {
                return Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
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
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: glassmorphismButton(
                                    text: 'Acceder',
                                    onPressed: () {
                                      print('object');
                                    }
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: glassmorphismButton(
                                    text: 'Registrarse',
                                    onPressed: () {
                                      print('object');
                                    }
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            glassmorphismButton(
                              text: 'Quiero evaluarme'.toUpperCase(),
                              onPressed: () {
                                print('asd');
                              }
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
              pageLength: _stories.length,
              storyLength: (int pageIndex) {
                return _stories.length;
              },
              indicatorDuration: const Duration(seconds: 15),
              onPageLimitReached: () {
                setState(() {
                  _counter.value += 1;
                });
              },
            );
          }
        ),
      )
    );
  }
}
