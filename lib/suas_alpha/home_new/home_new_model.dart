import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/drawer_content_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeNewModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  ProfilesRow? profileUser;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - newCustomAction] action in homeNew widget.
  List<double>? coordinates;
  // Stores action output result for [Backend Call - Insert Row] action in homeNew widget.
  UserLocationsRow? insertIncompleteRow;
  // Stores action output result for [Backend Call - API (Google Maps Reverse Geocoding Private)] action in homeNew widget.
  ApiCallResponse? googleGeocoding;
  // Stores action output result for [Backend Call - API (Get country byshort  iso code)] action in homeNew widget.
  ApiCallResponse? returnedCountryId;
  // Stores action output result for [Backend Call - API (Get all places)] action in homeNew widget.
  ApiCallResponse? allPlacesResponse;
  // Stores action output result for [Backend Call - API (Google Distance Matrix)] action in homeNew widget.
  ApiCallResponse? distancesREsult;
  // Stores action output result for [Backend Call - Update Row] action in homeNew widget.
  List<UserLocationsRow>? latestUserLocationSaved;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
