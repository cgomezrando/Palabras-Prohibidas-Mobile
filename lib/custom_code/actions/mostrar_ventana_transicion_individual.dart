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
//  mostrarVentanaTransicionIndividual  (MODO 2: uno describe, todos adivinan)
//  Llamar desde ACIERTO y FALLO en modo individual (gameMode == 2).
//    - currentTeam representa al JUGADOR que describe (rota 1..TeamCount).
//    - Al ACERTAR: se muestra la lista de jugadores; el que describe pulsa
//      el nombre del que adivinó. Suma +1 a ese jugador y +1 al que describe.
//    - Al FALLAR: no suma nadie; ventana con "Pasar de turno".
//  Después avanza la ronda rotando el describidor y deja turnPhase="waiting".
//  Requiere Include BuildContext.
// ==========================================================================

Future mostrarVentanaTransicionIndividual(BuildContext context) async {
  const Color fondoOscuro = Color(0xFF1B1140);
  const Color panelMorado = Color(0xFF2A1E5C);
  const Color bordeMorado = Color(0xFF5B4BCF);
  const Color verde = Color(0xFF3FB93F);
  const Color rojo = Color(0xFFE23B3B);
  const Color amarillo = Color(0xFFFFC107);
  const Color textoSuave = Color(0xFFB9AEE8);
  const List<Color> teamColors = [
    Color(0xFF00E5FF),
    Color(0xFFFF2D87),
    Color(0xFF0066FF),
    Color(0xFF00E676),
  ];

  final int total = FFAppState().TeamCount;
  final int describe = FFAppState().currentTeam; // 1..total

  String nombreDe(int n) {
    switch (n) {
      case 1:
        return FFAppState().Team1Name.isEmpty
            ? 'Jugador 1'
            : FFAppState().Team1Name;
      case 2:
        return FFAppState().Team2Name.isEmpty
            ? 'Jugador 2'
            : FFAppState().Team2Name;
      case 3:
        return FFAppState().Team3Name.isEmpty
            ? 'Jugador 3'
            : FFAppState().Team3Name;
      default:
        return FFAppState().Team4Name.isEmpty
            ? 'Jugador 4'
            : FFAppState().Team4Name;
    }
  }

  void sumarPunto(int n) {
    switch (n) {
      case 1:
        FFAppState().Team1Score = FFAppState().Team1Score + 1;
        break;
      case 2:
        FFAppState().Team2Score = FFAppState().Team2Score + 1;
        break;
      case 3:
        FFAppState().Team3Score = FFAppState().Team3Score + 1;
        break;
      default:
        FFAppState().Team4Score = FFAppState().Team4Score + 1;
        break;
    }
  }

  void avanzarRonda() {
    FFAppState().update(() {
      FFAppState().currentCardIndex = FFAppState().currentCardIndex + 1;
      FFAppState().CurrentTurn = FFAppState().CurrentTurn + 1;
      if (FFAppState().currentTeam < FFAppState().TeamCount) {
        FFAppState().currentTeam = FFAppState().currentTeam + 1;
      } else {
        FFAppState().currentTeam = 1;
      }
      FFAppState().CardAnswered = false;
      FFAppState().turnPhase = 'waiting';
    });
  }

  Widget marco(Widget child) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 26, vertical: 40),
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
        padding: const EdgeInsets.all(22),
        child: child,
      ),
    );
  }

  Widget botonAncho({
    required String texto,
    required IconData icono,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 14,
                  offset: const Offset(0, 5)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icono, color: Colors.white, size: 22),
              const SizedBox(width: 10),
              Text(texto,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return marco(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('¿QUIÉN LO ADIVINÓ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white)),
            const SizedBox(height: 4),
            Text('Describe: ${nombreDe(describe)}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Poppins', fontSize: 12, color: textoSuave)),
            const SizedBox(height: 18),
            // Lista de jugadores que pueden adivinar (todos menos el que describe)
            ...List.generate(total, (i) {
              final int jugador = i + 1;
              if (jugador == describe) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      FFAppState().update(() {
                        sumarPunto(jugador); // solo quien adivina
                        // El punto del que describe lo suma la cadena del botón ACIERTO.
                      });
                      avanzarRonda();
                      Navigator.of(dialogContext).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      decoration: BoxDecoration(
                        color: panelMorado,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: teamColors[i], width: 2),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                                color: teamColors[i], shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(nombreDe(jugador).toUpperCase(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white)),
                          ),
                          const Icon(Icons.add_circle_rounded,
                              color: verde, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 6),
            // Nadie acertó -> pasar sin puntos
            botonAncho(
              texto: 'NADIE ACERTÓ',
              icono: Icons.skip_next_rounded,
              color: rojo,
              onTap: () {
                avanzarRonda();
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
