import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'player_count_option_model.dart';
export 'player_count_option_model.dart';

class PlayerCountOptionWidget extends StatefulWidget {
  const PlayerCountOptionWidget({
    super.key,
    this.icon,
    String? label,
    String? onTap,
    bool? selected,
  })  : this.label = label ?? '1',
        this.onTap = onTap ?? 'set_state:playerCount=1',
        this.selected = selected ?? true;

  final Widget? icon;
  final String label;
  final String onTap;
  final bool selected;

  @override
  State<PlayerCountOptionWidget> createState() =>
      _PlayerCountOptionWidgetState();
}

class _PlayerCountOptionWidgetState extends State<PlayerCountOptionWidget> {
  late PlayerCountOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerCountOptionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.circular(9999.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).onPrimary,
          width: 5.0,
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.person_rounded,
            color: FlutterFlowTheme.of(context).onPrimary,
            size: 32.0,
          ),
          Text(
            valueOrDefault<String>(
              widget!.label,
              '1',
            ),
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  font: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).onPrimary,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  lineHeight: 1.4,
                ),
          ),
        ].divide(SizedBox(height: 4.0)),
      ),
    );
  }
}
