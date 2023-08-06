import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for emailLogin widget.
  TextEditingController? emailLoginController;
  String? Function(BuildContext, String?)? emailLoginControllerValidator;
  String? _emailLoginControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email Adress  is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for passwordLogin widget.
  TextEditingController? passwordLoginController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginControllerValidator;
  String? _passwordLoginControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 6) {
      return 'Password must be 6 or more characters';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (This user has username)] action in Button widget.
  ApiCallResponse? hasUsername;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailLoginControllerValidator = _emailLoginControllerValidator;
    passwordLoginVisibility = false;
    passwordLoginControllerValidator = _passwordLoginControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailLoginController?.dispose();
    passwordLoginController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
