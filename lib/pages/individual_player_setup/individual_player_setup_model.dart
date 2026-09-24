import '/backend/schema/structs/index.dart';
import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'individual_player_setup_widget.dart' show IndividualPlayerSetupWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IndividualPlayerSetupModel
    extends FlutterFlowModel<IndividualPlayerSetupWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for EQUIPO1 widget.
  FocusNode? equipo1FocusNode;
  TextEditingController? equipo1TextController;
  String? Function(BuildContext, String?)? equipo1TextControllerValidator;
  // State field(s) for EQUIPO2 widget.
  FocusNode? equipo2FocusNode;
  TextEditingController? equipo2TextController;
  String? Function(BuildContext, String?)? equipo2TextControllerValidator;
  // State field(s) for EQUIPO3 widget.
  FocusNode? equipo3FocusNode;
  TextEditingController? equipo3TextController;
  String? Function(BuildContext, String?)? equipo3TextControllerValidator;
  // State field(s) for EQUIPO4 widget.
  FocusNode? equipo4FocusNode;
  TextEditingController? equipo4TextController;
  String? Function(BuildContext, String?)? equipo4TextControllerValidator;
  // Stores action output result for [Custom Action - loadAndShuffleCards] action in Container widget.
  List<QuestionStruct>? loadedCards;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    equipo1FocusNode?.dispose();
    equipo1TextController?.dispose();

    equipo2FocusNode?.dispose();
    equipo2TextController?.dispose();

    equipo3FocusNode?.dispose();
    equipo3TextController?.dispose();

    equipo4FocusNode?.dispose();
    equipo4TextController?.dispose();

    buttonModel.dispose();
  }
}
