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
//  mostrarVentanaModo
//  Muestra una ventana para elegir la modalidad de juego.
//    - PAREJAS  -> gameMode = 1, navega a la pantalla de setup por parejas.
//    - ROTACIÓN -> gameMode = 2, navega a la pantalla de setup individual.
//  Llamar desde el botón JUGAR del HomeScreen.
//  Requiere Include BuildContext.
//
//  IMPORTANTE: sustituye los nombres de ruta 'PairsPlayerSetup' y
//  'IndividualPlayerSetup' por los routeName reales de tus pantallas
//  (los ves en cada página: static String routeName = '...').
// ==========================================================================

Future mostrarVentanaModo(BuildContext context) async {
  const Color fondoOscuro = Color(0xFF1B1140);
  const Color panelMorado = Color(0xFF2A1E5C);
  const Color bordeMorado = Color(0xFF5B4BCF);
  const Color amarillo = Color(0xFFFFC107);
  const Color textoSuave = Color(0xFFB9AEE8);
  const Color cian = Color(0xFF00E5FF);
  const Color rosa = Color(0xFFFF2D87);

  // Tarjeta de modo reutilizable.
  Widget tarjetaModo({
    required IconData icono,
    required Color colorIcono,
    required String titulo,
    required String descripcion,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: panelMorado,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: colorIcono, width: 2),
            boxShadow: [
              BoxShadow(
                  color: colorIcono.withOpacity(0.3),
                  blurRadius: 14,
                  offset: const Offset(0, 4)),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorIcono.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: colorIcono, width: 2),
                ),
                child: Icon(icono, color: colorIcono, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      descripcion,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        height: 1.3,
                        color: textoSuave,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                  color: Colors.white, size: 22),
            ],
          ),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'ELIGE MODALIDAD',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '¿Cómo queréis jugar?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: textoSuave,
                ),
              ),
              const SizedBox(height: 20),
              // PAREJAS -> modo 1
              tarjetaModo(
                icono: Icons.groups_rounded,
                colorIcono: cian,
                titulo: 'PAREJAS',
                descripcion: 'Dos jugadores juegan juntos.',
                onTap: () {
                  FFAppState().gameMode = 1;
                  Navigator.of(dialogContext).pop();
                  // Sustituye por el routeName real de tu setup por parejas:
                  context.pushNamed('PairsPlayerSetup');
                },
              ),
              // ROTACIÓN -> modo 2
              tarjetaModo(
                icono: Icons.sync_rounded,
                colorIcono: rosa,
                titulo: 'ROTACIÓN',
                descripcion:
                    'Uno describe y el resto adivina. El turno va cambiando.',
                onTap: () {
                  FFAppState().gameMode = 2;
                  Navigator.of(dialogContext).pop();
                  // Sustituye por el routeName real de tu setup individual:
                  context.pushNamed('IndividualPlayerSetup');
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
