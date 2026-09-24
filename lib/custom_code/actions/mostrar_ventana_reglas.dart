// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// ==========================================================================
//  mostrarVentanaReglas
//  Muestra las reglas del juego en una ventana con la estética de la app.
//  Contenido scrollable (texto largo). Llamar desde el botón de ayuda (?).
//  Requiere Include BuildContext.
// ==========================================================================

Future mostrarVentanaReglas(BuildContext context) async {
  // -------- Paleta --------
  const Color fondoOscuro = Color(0xFF1B1140);
  const Color panelMorado = Color(0xFF2A1E5C);
  const Color bordeMorado = Color(0xFF5B4BCF);
  const Color amarillo = Color(0xFFFFC107);
  const Color verde = Color(0xFF3FB93F);
  const Color rojo = Color(0xFFE23B3B);
  const Color textoSuave = Color(0xFFB9AEE8);

  // Título de sección (amarillo, píldora).
  Widget seccion(String titulo) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: panelMorado,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: bordeMorado, width: 1.5),
            ),
            child: Text(
              titulo.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 11,
                letterSpacing: 1,
                color: amarillo,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Párrafo de cuerpo.
  Widget cuerpo(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        texto,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 12,
          height: 1.4,
          color: textoSuave,
        ),
      ),
    );
  }

  // Línea de puntuación con color.
  Widget puntuacion(String texto, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        texto,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 12,
          height: 1.35,
          color: color,
        ),
      ),
    );
  }

  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (dialogContext) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
        child: Container(
          decoration: BoxDecoration(
            color: fondoOscuro,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: bordeMorado, width: 2.5),
            boxShadow: [
              BoxShadow(
                  color: bordeMorado.withOpacity(0.5),
                  blurRadius: 30,
                  spreadRadius: 2),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Cabecera fija
              const Icon(Icons.menu_book_rounded, color: amarillo, size: 34),
              const SizedBox(height: 8),
              const Text(
                'REGLAS DEL JUEGO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              // Contenido scrollable
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      seccion('Objetivo'),
                      cuerpo(
                          'Consigue que tu equipo adivine la palabra secreta antes de que termine el tiempo. Pero cuidado: no puedes utilizar ninguna de las palabras prohibidas que aparecen en la carta.'),
                      seccion('Desarrollo de una ronda'),
                      cuerpo(
                          '1. Al inicio de cada turno, el jugador activo pulsa REVELAR CARTA y verá:\n     · Una palabra principal que debe hacer adivinar.\n     · Cuatro palabras prohibidas que NO puede decir y debe proteger para que su equipo no las vea.\n2. Tendrá 10 segundos para leer la carta y prepararse.\n3. Después comienza automáticamente la cuenta atrás.\n4. Durante 1 minuto describe la palabra principal para que su equipo la adivine. Un jugador de otro equipo vigila que no diga ninguna palabra prohibida.\n5. Puede utilizar:\n     · Sinónimos.\n     · Explicaciones.\n     · Ejemplos.\n     · Situaciones relacionadas.\n6. No puede utilizar:\n     · La palabra principal.\n     · Ninguna palabra prohibida.\n     · Variaciones evidentes de las palabras prohibidas.\n7. Al terminar el turno, se elige revelar la carta o pasar de turno para el siguiente equipo.\n8. Puedes volver a la configuración de jugadores desde el icono de la casa.'),
                      seccion('Palabras Prohibidas'),
                      cuerpo(
                          'Si el jugador dice la palabra principal o una de las prohibidas, la ronda termina y el equipo es penalizado. Para continuar, se pasa al siguiente equipo.'),
                      seccion('Equipos'),
                      cuerpo(
                          'El juego admite hasta 4 equipos. Cada equipo debe tener un mínimo de 2 jugadores.'),
                      seccion('Fin del Juego'),
                      cuerpo(
                          'La partida termina cuando se han jugado todas las cartas previstas. Gana el equipo con más puntos, y se muestra la clasificación final.'),
                      seccion('Consejos'),
                      cuerpo(
                          '     · Habla rápido y con claridad.\n     · Utiliza ejemplos sencillos.\n     · No pierdas tiempo en una palabra difícil.\n     · Piensa en pistas que relacionen conceptos.\n     · Mantén la calma y diviértete.\n\n¡Cuantas más palabras adivine tu equipo, más cerca estarás de la victoria!'),
                      const SizedBox(height: 16),
                      // Bloque de puntuación
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: panelMorado,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: bordeMorado, width: 1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            puntuacion(
                                'Si el equipo acierta: +1 punto.', verde),
                            puntuacion('Si no adivina en 1 minuto: 0 puntos.',
                                textoSuave),
                            puntuacion(
                                'Si usa una palabra prohibida: -1 punto.',
                                rojo),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Botón entendido (fijo abajo)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: verde,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: verde.withOpacity(0.45),
                            blurRadius: 16,
                            offset: const Offset(0, 6)),
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle_outline_rounded,
                            color: Colors.white, size: 22),
                        SizedBox(width: 10),
                        Text(
                          '¡ENTENDIDO!',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
