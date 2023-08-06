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

class CreateAccountModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool passwordMismatch = false;

  bool acceptedTerms = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Mentor Signup check)] action in createAccount widget.
  ApiCallResponse? returnedCode;
  // State field(s) for emailSignup widget.
  TextEditingController? emailSignupController;
  String? Function(BuildContext, String?)? emailSignupControllerValidator;
  String? _emailSignupControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Emai Address is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for passwordSignup widget.
  TextEditingController? passwordSignupController;
  late bool passwordSignupVisibility;
  String? Function(BuildContext, String?)? passwordSignupControllerValidator;
  String? _passwordSignupControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 6) {
      return 'Password must be 6 or more characters';
    }

    return null;
  }

  // State field(s) for passwordconfirm widget.
  TextEditingController? passwordconfirmController;
  late bool passwordconfirmVisibility;
  String? Function(BuildContext, String?)? passwordconfirmControllerValidator;
  String? _passwordconfirmControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirmation of Password is required';
    }

    if (val.length < 6) {
      return 'Password must be 6 or more characters';
    }

    return null;
  }

  // State field(s) for Checkboxter widget.
  bool? checkboxterValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailSignupControllerValidator = _emailSignupControllerValidator;
    passwordSignupVisibility = false;
    passwordSignupControllerValidator = _passwordSignupControllerValidator;
    passwordconfirmVisibility = false;
    passwordconfirmControllerValidator = _passwordconfirmControllerValidator;
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
