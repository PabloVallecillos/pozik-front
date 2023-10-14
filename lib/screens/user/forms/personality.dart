import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'form.dart';

class PersonalityScreen extends StatelessWidget {
  const PersonalityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FormScreen(
      title: AppLocalizations.of(context).personality_test,
      questions: const <String>[
        '1. Estoy todo el día soñando despierto/a',
        '2. Me molesta aceptar que me he equivocado',
        '3. Soy una persona muy creativa',
        '4. Me voy por las ramas cuando hablo',
        '5. Prefiero los deportes en solitario que en equipo',
        '6. Me siento culpable cuando llego tarde a una quedada con un amigo',
        '7. Soy la clase de persona que nunca se saltaría un semáforo en rojo',
        '8. Robar algo en una tienda me daría un infarto',
        '9. Me gusta el riesgo',
        '10. La monotonía me estresa',
        '11. Me afecta mucho que los demás hablen de mí',
        '12. Estoy nervioso cuando hablo en público',
        '13. Suelo estar callado cuando estoy en grupo',
        '14. Disfruto hablando en público',
        '15. Me resulta fácil confiar en la gente',
        '16. Soy competitivo/a',
        '17. Soy una persona amable',
        '18. Me molesta la gente que copia en los exámenes',
        '19. Antepongo las necesidades de los demás a las mías',
        '20. Es muy importante ser el mejor en el trabajo',
        '21. Me estreso con facilidad',
        '22. Me emociono con cualquier cosa',
        '23. Tengo un pronto muy fuerte',
        '24. Mis nervios son de acero, aguanto muy bien la tensión',
        '25. Siempre quiero más de lo que tengo, me conformo con poco',
        '26. Romper las reglas me hace sentir mal',
        '27. En mi vida busco adrenalina',
        '28. El fin justifica los medios',
        '29. Manipular a las personas es negativo para uno mismo',
        '30. Me agobia estar solo/a durante mucho tiempo',
        '31. Socializar me quita energía',
        '32. Cuando estoy triste, prefiero estar solo',
        '33. Me gusta hablar de lo que siento con los demás',
        '34. Soy un peligro para mí mismo',
        '35. Me entiendo muy bien, nunca desconozco la causa de porqué hago las cosas',
        '36. Me arrepiento muchas veces de lo que hago',
        '37. La estabilidad emocional no va conmigo',
        '38. Prefiero tener pareja que no tenerla',
        '39. Por amor, aguanto muchas cosas',
        '40. Suelo tener miedo a que me abandone mi pareja y/o mis amigos',
        '41. Soy influenciable por los demás',
        '42. Todo el mundo merece mi atención',
        '43. En el futuro tendré mucho éxito',
        '44. Soy una persona bien valorada por la sociedad',
        '45. Sería muy positivo ser famoso y reconocido por todo el mundo',
        '46. Soy maniático con la comida',
        '47. Me da miedo enfermar',
        '48. Soy optimista',
        '49. Suelo pensar cuando salgo de casa que me he dejado algo encendido o similares',
        '50. Las personas por lo general son malas',
        '51. Tengo un poder espiritual poderoso',
        '52. Me entero de cosas que nadie se entera',
        '53. Existe una conspiración mundial para dominarnos',
      ],
      answers: <String>[
        AppLocalizations.of(context).strongly_disagree,
        AppLocalizations.of(context).disagree,
        AppLocalizations.of(context).neither_agree_nor_disagree,
        AppLocalizations.of(context).agree,
        AppLocalizations.of(context).strongly_agree,
      ]
    );
  }
}
