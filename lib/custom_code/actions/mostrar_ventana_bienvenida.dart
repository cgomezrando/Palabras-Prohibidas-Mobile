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
//  mostrarVentanaBienvenida
//  Llamar en el On Page Load de WordScreen, como PRIMER paso.
//  Muestra las reglas del juego. Al pulsar CONTINUAR:
//    - pone turnPhase = "waiting"
//    - cierra el diálogo
//  La action espera (await) hasta que el usuario pulse CONTINUAR.
//  DESPUÉS, en la misma cadena del On Page Load, arranca el
//  previewTimerController con acciones nativas (ver instrucciones).
//  Requiere "Include BuildContext" activado.
// ==========================================================================

Future mostrarVentanaBienvenida(BuildContext context) async {
  // --- Paleta (misma que el resto de ventanas) ---
  const Color fondoOscuro = Color(0xFF1B1140);
  const Color panelMorado = Color(0xFF2A1E5C);
  const Color bordeMorado = Color(0xFF5B4BCF);
  const Color crema = Color(0xFFF7F0D8);
  const Color textoOscuro = Color(0xFF1A1440);
  const Color verde = Color(0xFF3FB93F);
  const Color amarillo = Color(0xFFFFC107);
  const Color textoSuave = Color(0xFFB9AEE8);

  // Fila de regla: icono + texto.
  Widget regla(IconData icono, Color colorIcono, String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icono, color: colorIcono, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 13,
                height: 1.35,
                color: Colors.white,
              ),
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
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Título
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                decoration: BoxDecoration(
                  color: panelMorado,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: bordeMorado, width: 1.5),
                ),
                child: const Text(
                  '¡EL JUEGO VA A EMPEZAR!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Panel de reglas
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: panelMorado.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: bordeMorado, width: 1.5),
                ),
                child: Column(
                  children: [
                    regla(
                      Icons.timer_rounded,
                      amarillo,
                      'Al inicio de cada turno tendrás 5 segundos para pensar y prepararte.',
                    ),
                    regla(
                      Icons.record_voice_over_rounded,
                      const Color(0xFF00E5FF),
                      'Describe la PALABRA CLAVE para que tu equipo o el resto de jugadores la adivine.',
                    ),
                    regla(
                      Icons.block_rounded,
                      const Color(0xFFE23B3B),
                      'No puedes decir ninguna de las PALABRAS PROHIBIDAS.',
                    ),
                    regla(
                      Icons.emoji_events_rounded,
                      amarillo,
                      ',Pulsa ACIERTO si lo adivinan, o FALLO si te saltas una regla o se acaba el tiempo. En el modo individual, recuerda marcar quién ha adivinado la palabra para darle su punto',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              // Botón CONTINUAR
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    FFAppState().update(() {
                      FFAppState().turnPhase = 'waiting';
                      FFAppState().CardAnswered = false;
                    });
                    Navigator.of(dialogContext).pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
                    decoration: BoxDecoration(
                      color: verde,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: verde.withOpacity(0.45),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_arrow_rounded,
                            color: Colors.white, size: 24),
                        SizedBox(width: 12),
                        Text(
                          'CONTINUAR',
                          style: TextStyle(
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
              ),
            ],
          ),
        ),
      );
    },
  );
}
