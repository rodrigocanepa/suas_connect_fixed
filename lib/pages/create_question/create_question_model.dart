import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateQuestionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  QueriesRow? newQuery;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  QueryUserPlacesRow? userQueryPlace;
  // Stores action output result for [Backend Call - API (Get categories)] action in Button widget.
  ApiCallResponse? categoryIdReturned;
  // State field(s) for place widget.
  TextEditingController? placeController;
  String? Function(BuildContext, String?)? placeControllerValidator;
  // State field(s) for title widget.
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  String? _titleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Title is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // State field(s) for body widget.
  TextEditingController? bodyController;
  String? Function(BuildContext, String?)? bodyControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    titleControllerValidator = _titleControllerValidator;
  }

  void dispose() {
    placeController?.dispose();
    titleController?.dispose();
    bodyController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
