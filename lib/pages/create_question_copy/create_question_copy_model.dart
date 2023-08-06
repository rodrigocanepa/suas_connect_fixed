import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateQuestionCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for place widget.
  TextEditingController? placeController;
  String? Function(BuildContext, String?)? placeControllerValidator;
  // State field(s) for title widget.
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for CAT widget.
  TextEditingController? catController;
  String? Function(BuildContext, String?)? catControllerValidator;
  // State field(s) for body widget.
  TextEditingController? bodyController;
  String? Function(BuildContext, String?)? bodyControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    placeController?.dispose();
    titleController?.dispose();
    catController?.dispose();
    bodyController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
