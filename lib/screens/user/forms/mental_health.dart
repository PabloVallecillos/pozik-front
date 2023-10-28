import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pozik_front/config/images.dart';

import 'form.dart';

class MentalHealthFormScreen extends StatelessWidget {
  const MentalHealthFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FormScreen(
      img: mentalHealthImg,
      title: AppLocalizations.of(context).mental_health_evaluation,
      subtitle: AppLocalizations.of(context).mental_health_subtitle,
      questions: const <String>[
        '1. He tenido ataques de ansiedad',
        '2. He tenido insomnio',
        '3. Me he sentido preocupado por algo',
        '4. Me ha parecido que la realidad no era verdad',
        '5. He procrastinado demasiado',
        '6. Me apetecía quedarme todo el día en la cama',
        '7. Siento que me cuesta más esfuerzo hacer cualquier cosa',
        '8. He llorado en más de una ocasión',
        '9. He pensado en la muerte y/o en el suicidio',
        '10. Me he sentido vacío',
        '11. Estoy tomando mucho riesgo',
        '12. Estoy pensando en hacerme rico',
        '13. Mi vida sexual está afectando a mi vida',
        '14. Siento que nada me puede ir mal nunca',
        '15. Quiero hacer cambios drásticos en mi vida',
        '16. Estoy obsesionado con algo',
        '17. Tengo muchas manías/rituales',
        '18. Reviso una y otra vez las cosas y no puedo parar',
        '19. Estoy obsesionado con la higiene',
        '20. No organizarme el día me da ansiedad',
        '21. Tengo sobrepeso',
        '22. Hay alimentos que me hacen sentir culpable si los como',
        '23. Tengo complejos físicos que me afectan',
        '24. Me doy atracones',
        '25. Me aterroriza engordar',
      ],
      answers: <String>[
        AppLocalizations.of(context).yes,
        AppLocalizations.of(context).no,
      ]
    );
  }
}
