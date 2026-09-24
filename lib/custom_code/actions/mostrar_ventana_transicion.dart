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
//  mostrarVentanaTransicion
//  Llamar desde el onTap de ACIERTO y de FALLO (como último paso).
//  Muestra un diálogo con "Revelar carta" y "Pasar de turno".
//   - Pasar de turno  -> avanza el turno y cierra.
//   - Revelar carta   -> muestra la carta actual con un botón "Continuar"
//                        que también avanza el turno.
//  Todo el avance de estado se hace aquí dentro, sin tocar el widget tree.
// ==========================================================================

Future mostrarVentanaTransicion(BuildContext context) async {
  // --- Paleta de la estética del juego ---
  const Color fondoOscuro = Color(0xFF1B1140); // morado profundo del fondo
  const Color panelMorado = Color(0xFF2A1E5C); // panel de la tarjeta
  const Color bordeMorado = Color(0xFF5B4BCF); // borde violeta
  const Color crema = Color(0xFFF7F0D8); // tarjeta palabra clave
  const Color textoOscuro = Color(0xFF1A1440); // texto sobre crema
  const Color verde = Color(0xFF3FB93F); // botón acierto/revelar
  const Color rojo = Color(0xFFE23B3B); // botón pasar de turno
  const Color amarillo = Color(0xFFFFC107); // acentos
  const Color chip1 = Color(0xFFFF2D87); // nº 1
  const Color chip2 = Color(0xFF0066FF); // nº 2
  const Color chip3 = Color(0xFFFFC107); // nº 3
  const Color chip4 = Color(0xFF6A3FE2); // nº 4

  // Avanza el turno (misma lógica que tu botón de cambiar jugador).
  void avanzarTurno() {
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

  // Botón grande reutilizable.
  Widget botonGrande({
    required String texto,
    required IconData icono,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.45),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icono, color: Colors.white, size: 24),
              const SizedBox(width: 12),
              Text(
                texto,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Envoltura del diálogo con el marco morado.
  Widget marco({required Widget child}) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
      child: Container(
        decoration: BoxDecoration(
          color: fondoOscuro,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: bordeMorado, width: 2.5),
          boxShadow: [
            BoxShadow(
              color: bordeMorado.withOpacity(0.5),
              blurRadius: 30,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.all(22),
        child: child,
      ),
    );
  }

  // Chip numerado + palabra prohibida.
  Widget filaProhibida(int numero, String palabra, Color colorChip) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: colorChip, shape: BoxShape.circle),
            child: Text(
              '$numero',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              palabra,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: textoOscuro,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------
  //  DIÁLOGO 2: carta revelada + botón continuar
  // -----------------------------------------------------------------------
  Future<void> mostrarCartaRevelada() async {
    final carta =
        FFAppState().GameCards.elementAtOrNull(FFAppState().currentCardIndex);
    final palabra = carta?.palabraAdivinar ?? '...';
    final p1 = carta?.palabraProhibida1 ?? '';
    final p2 = carta?.palabraProhibida2 ?? '';
    final p3 = carta?.palabraProhibida3 ?? '';
    final p4 = carta?.palabraProhibida4 ?? '';

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return marco(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Etiqueta PALABRA CLAVE
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                decoration: BoxDecoration(
                  color: panelMorado,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: bordeMorado, width: 1.5),
                ),
                child: const Text(
                  'PALABRA CLAVE',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Tarjeta crema con la palabra
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                decoration: BoxDecoration(
                  color: crema,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: amarillo, width: 3),
                ),
                child: Text(
                  palabra.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: textoOscuro,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Etiqueta PALABRAS PROHIBIDAS
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                decoration: BoxDecoration(
                  color: panelMorado,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: bordeMorado, width: 1.5),
                ),
                child: const Text(
                  'PALABRAS PROHIBIDAS',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Lista prohibidas sobre panel crema
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: crema,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: bordeMorado, width: 2),
                ),
                child: Column(
                  children: [
                    filaProhibida(1, p1.toUpperCase(), chip1),
                    filaProhibida(2, p2.toUpperCase(), chip2),
                    filaProhibida(3, p3.toUpperCase(), chip3),
                    filaProhibida(4, p4.toUpperCase(), chip4),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Botón continuar -> avanza turno
              botonGrande(
                texto: 'CONTINUAR',
                icono: Icons.arrow_forward_rounded,
                color: verde,
                onTap: () {
                  avanzarTurno();
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // -----------------------------------------------------------------------
  //  DIÁLOGO 1: elección revelar / pasar de turno
  // -----------------------------------------------------------------------
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return marco(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '¿QUÉ QUIERES HACER?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Revela la carta para comprobarla\no pasa directamente de turno',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Color(0xFFB9AEE8),
              ),
            ),
            const SizedBox(height: 24),
            botonGrande(
              texto: 'REVELAR CARTA',
              icono: Icons.visibility_rounded,
              color: verde,
              onTap: () async {
                Navigator.of(dialogContext).pop();
                await mostrarCartaRevelada();
              },
            ),
            const SizedBox(height: 14),
            botonGrande(
              texto: 'PASAR DE TURNO',
              icono: Icons.skip_next_rounded,
              color: rojo,
              onTap: () {
                avanzarTurno();
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
