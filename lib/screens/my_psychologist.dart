import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pozik_front/config/colors.dart';

import '../config/images.dart';

class MyPsychologistScreen extends StatelessWidget {
  const MyPsychologistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height / 2,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Tu psicólogo', style: GoogleFonts.montserrat(
              color: primary,
              fontWeight: FontWeight.bold
            ),),
            background: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  juanUriarteImg,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xfff7f7f7)],
                    ),
                  ),
                ),
              ],
            ),
            titlePadding: EdgeInsets.only(left: 32.5),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 32.5, right: 32.5, top: 20),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Conoce a'),
                  TextSpan(text: ' Juan Uriarte', style: TextStyle(fontWeight: FontWeight.bold, color: primary)),
                  TextSpan(text: ', fundador e ideador de Pozik, psicólogo especializado en los ',),
                  TextSpan(text: 'Trastornos de Conducta Alimentaria', style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(text: '. Es director del centro',),
                  // TextSpan(text: 'https://juanuriartepsicologia.com ', style: TextStyle(color: primary),),
                  TextSpan(text: ', y divulgador en materia psicológica. Te orientará en el proceso de '),
                  TextSpan(text: 'evaluación y derivación', style: TextStyle(fontWeight: FontWeight.bold, color: primary)),
                  TextSpan(text: ' a un profesional que se ajuste a tus necesidades, resolviendo las dudas que tengas.'),
                ]
              )
            ),
          )
        ),
      ],
    );
  }
}