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
//  mostrarVentanaResultados
//  Reemplaza la ResultsScreen. Calcula el ranking y el ganador (o empate)
//  y muestra una ventana con la clasificación, alineada con la estética
//  de la app. Al pulsar "VOLVER AL INICIO" navega a HomeScreen.
//  Llamar en lugar de navegar a ResultsScreen (fase fin de partida).
//  Requiere Include BuildContext.
// ==========================================================================

Future mostrarVentanaResultados(BuildContext context) async {
  // -------- Paleta --------
  const Color fondoOscuro = Color(0xFF1B1140);
  const Color panelMorado = Color(0xFF2A1E5C);
  const Color bordeMorado = Color(0xFF5B4BCF);
  const Color amarillo = Color(0xFFFFC107);
  const Color verde = Color(0xFF3FB93F);
  const Color textoSuave = Color(0xFFB9AEE8);
  // Colores por equipo (mismos que la cabecera del juego)
  const List<Color> teamColors = [
    Color(0xFF00E5FF), // Team 1
    Color(0xFFFF2D87), // Team 2
    Color(0xFF0066FF), // Team 3
    Color(0xFF00E676), // Team 4
  ];

  final int teamCount = FFAppState().TeamCount;

  // Construye la lista de equipos activos con nombre, puntuación y color.
  final List<Map<String, dynamic>> equipos = [
    {
      'nombre':
          FFAppState().Team1Name.isEmpty ? 'Equipo 1' : FFAppState().Team1Name,
      'score': FFAppState().Team1Score,
      'color': teamColors[0],
    },
    {
      'nombre':
          FFAppState().Team2Name.isEmpty ? 'Equipo 2' : FFAppState().Team2Name,
      'score': FFAppState().Team2Score,
      'color': teamColors[1],
    },
    {
      'nombre':
          FFAppState().Team3Name.isEmpty ? 'Equipo 3' : FFAppState().Team3Name,
      'score': FFAppState().Team3Score,
      'color': teamColors[2],
    },
    {
      'nombre':
          FFAppState().Team4Name.isEmpty ? 'Equipo 4' : FFAppState().Team4Name,
      'score': FFAppState().Team4Score,
      'color': teamColors[3],
    },
  ].take(teamCount).toList();

  // Ordena por puntuación descendente.
  equipos.sort((a, b) => (b['score'] as int).compareTo(a['score'] as int));

  // Determina ganador o empate.
  final int maxScore = equipos.first['score'] as int;
  final ganadores =
      equipos.where((e) => (e['score'] as int) == maxScore).toList();
  final bool hayEmpate = ganadores.length > 1;
  final String tituloGanador =
      hayEmpate ? '¡EMPATE!' : (ganadores.first['nombre'] as String);

  // -------- Fila de clasificación --------
  Widget filaEquipo(int posicion, Map<String, dynamic> eq) {
    final Color color = eq['color'] as Color;
    final bool esGanador = (eq['score'] as int) == maxScore;
    // Medalla por posición
    IconData? medalla;
    Color medallaColor = textoSuave;
    if (posicion == 1) {
      medalla = Icons.emoji_events_rounded;
      medallaColor = amarillo;
    } else if (posicion == 2) {
      medalla = Icons.emoji_events_rounded;
      medallaColor = const Color(0xFFC0C0C0);
    } else if (posicion == 3) {
      medalla = Icons.emoji_events_rounded;
      medallaColor = const Color(0xFFCD7F32);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: panelMorado,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: esGanador ? amarillo : bordeMorado,
          width: esGanador ? 2.5 : 1.5,
        ),
      ),
      child: Row(
        children: [
          // Posición
          Text(
            '$posicion',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          // Punto de color del equipo
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          // Nombre
          Expanded(
            child: Text(
              (eq['nombre'] as String).toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          if (medalla != null) ...[
            Icon(medalla, color: medallaColor, size: 22),
            const SizedBox(width: 8),
          ],
          // Puntuación
          Text(
            '${eq['score']}',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: amarillo,
            ),
          ),
        ],
      ),
    );
  }

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
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
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Trofeo grande
              const Icon(Icons.emoji_events_rounded, color: amarillo, size: 48),
              const SizedBox(height: 8),
              // Etiqueta
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: panelMorado,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: bordeMorado, width: 1.5),
                ),
                child: Text(
                  hayEmpate ? 'RESULTADO' : 'GANADOR',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Nombre del ganador / empate
              Text(
                tituloGanador.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: amarillo,
                ),
              ),
              const SizedBox(height: 20),
              // Clasificación
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                child: Column(
                  children: List.generate(
                    equipos.length,
                    (i) => filaEquipo(i + 1, equipos[i]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Botón volver al inicio
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.of(dialogContext).pop();
                    context.goNamed('HomeScreen');
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
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
                        Icon(Icons.home_rounded, color: Colors.white, size: 24),
                        SizedBox(width: 10),
                        Text(
                          'VOLVER AL INICIO',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
