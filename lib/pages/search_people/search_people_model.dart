import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPeopleModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool showFallback = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for searchBox widget.
  TextEditingController? searchBoxController;
  String? Function(BuildContext, String?)? searchBoxControllerValidator;
  String? _searchBoxControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Must input a username';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Username is not valid';
    }
    return null;
  }

  Completer<List<ProfilesRow>>? requestCompleter;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchBoxControllerValidator = _searchBoxControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    searchBoxController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
