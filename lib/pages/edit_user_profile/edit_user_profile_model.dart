import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/delete_account/delete_account_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditUserProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool usernameTaken = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  String? _yourNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Your Name is required';
    }

    if (val.length < 3) {
      return 'Your name must be at least 3 characters long';
    }
    if (val.length > 52) {
      return 'Your name can\'t be more than 52 characters long';
    }

    return null;
  }

  // State field(s) for userName widget.
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  String? _userNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Your Username is required';
    }

    if (val.length < 5) {
      return 'Username can\'t be less than 5 characters';
    }
    if (val.length > 50) {
      return 'Username can\'t be more than 50 characters';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for bio widget.
  TextEditingController? bioController;
  String? Function(BuildContext, String?)? bioControllerValidator;
  String? _bioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Bio is required';
    }

    if (val.length < 1) {
      return 'Bio must be at least 1 character long';
    }
    if (val.length > 160) {
      return 'Bio must be 160 characters or less';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Get username)] action in Button widget.
  ApiCallResponse? taken;
  // Stores action output result for [Backend Call - Update Row] action in Button widget.
  List<ProfilesRow>? updatedRowIzq;
  // Stores action output result for [Backend Call - Update Row] action in Button widget.
  List<ProfilesRow>? updatedRowDer;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    yourNameControllerValidator = _yourNameControllerValidator;
    userNameControllerValidator = _userNameControllerValidator;
    bioControllerValidator = _bioControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    yourNameController?.dispose();
    userNameController?.dispose();
    bioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
