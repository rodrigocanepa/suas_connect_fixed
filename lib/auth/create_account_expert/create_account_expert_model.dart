import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAccountExpertModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool passwordMismatch = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Mentor Signup check)] action in createAccountExpert widget.
  ApiCallResponse? returnedCode;
  // State field(s) for emailSignup widget.
  TextEditingController? emailSignupController;
  String? Function(BuildContext, String?)? emailSignupControllerValidator;
  // State field(s) for passwordSignup widget.
  TextEditingController? passwordSignupController;
  late bool passwordSignupVisibility;
  String? Function(BuildContext, String?)? passwordSignupControllerValidator;
  // State field(s) for passwordconfirm widget.
  TextEditingController? passwordconfirmController;
  late bool passwordconfirmVisibility;
  String? Function(BuildContext, String?)? passwordconfirmControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordSignupVisibility = false;
    passwordconfirmVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailSignupController?.dispose();
    passwordSignupController?.dispose();
    passwordconfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
