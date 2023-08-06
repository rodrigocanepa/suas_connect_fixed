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
import 'home_new_model.dart';
export 'home_new_model.dart';

class HomeNewWidget extends StatefulWidget {
  const HomeNewWidget({Key? key}) : super(key: key);

  @override
  _HomeNewWidgetState createState() => _HomeNewWidgetState();
}

class _HomeNewWidgetState extends State<HomeNewWidget>
    with TickerProviderStateMixin {
  late HomeNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 90.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'wrapOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 90.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 170.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeNewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homeNew'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_NEW_PAGE_homeNew_ON_INIT_STATE');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if (loggedIn && (FFAppState().completedSetup == false)) {
        logFirebaseEvent('homeNew_navigate_to');

        context.goNamed(
          'createYourProfile2',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 200),
            ),
          },
        );
      } else {
        logFirebaseEvent('homeNew_custom_action');
        _model.coordinates = await actions.newCustomAction(
          currentUserLocationValue,
        );
        logFirebaseEvent('homeNew_backend_call');
        _model.insertIncompleteRow = await UserLocationsTable().insert({
          'user_id': currentUserUid,
          'latlang_text':
              '${_model.coordinates?.first?.toString()}, ${_model.coordinates?.last?.toString()}',
          'lng': _model.coordinates?.last,
          'lat': _model.coordinates?.first,
          'closest_place': 'de5b3a0a-cd79-43e8-8c4d-b41ddacbbdc4',
        });
        logFirebaseEvent('homeNew_backend_call');
        _model.googleGeocoding =
            await GoogleMapsReverseGeocodingPrivateCall.call(
          latlng:
              '${_model.coordinates?.first?.toString()},${_model.coordinates?.last?.toString()}',
        );
        if (GoogleMapsReverseGeocodingPrivateCall.resultArray(
              (_model.googleGeocoding?.jsonBody ?? ''),
            ).length >=
            1) {
          logFirebaseEvent('homeNew_backend_call');
          _model.returnedCountryId =
              await SupabasePublicGroup.getCountryByshortIsoCodeCall.call(
            iso2code: (GoogleMapsReverseGeocodingPrivateCall.shortNames(
              (_model.googleGeocoding?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()
                .last,
          );
          logFirebaseEvent('homeNew_backend_call');
          await UserLocationsTable().update(
            data: {
              'country': valueOrDefault<int>(
                SupabasePublicGroup.getCountryByshortIsoCodeCall.countryID(
                  (_model.returnedCountryId?.jsonBody ?? ''),
                ),
                250,
              ),
              'google_compound_code': valueOrDefault<String>(
                GoogleMapsReverseGeocodingPrivateCall.compoundCode(
                  (_model.googleGeocoding?.jsonBody ?? ''),
                ).toString(),
                'QWQ3+V98 Lisbon, Portugal',
              ),
            },
            matchingRows: (rows) => rows.eq(
              'id',
              _model.insertIncompleteRow?.id,
            ),
          );
        } else {
          logFirebaseEvent('homeNew_backend_call');
          await UserLocationsTable().update(
            data: {
              'country': 250,
              'google_compound_code': valueOrDefault<String>(
                GoogleMapsReverseGeocodingPrivateCall.compoundCode(
                  (_model.googleGeocoding?.jsonBody ?? ''),
                ).toString(),
                'QWQ3+V98 Lisbon, Portugal',
              ),
            },
            matchingRows: (rows) => rows.eq(
              'id',
              _model.insertIncompleteRow?.id,
            ),
          );
        }

        logFirebaseEvent('homeNew_backend_call');
        await UserLocationsTable().update(
          data: {
            'closest_place': 'dd73432b-b8e0-4219-b8a0-e284a2e1735a',
          },
          matchingRows: (rows) => rows.eq(
            'id',
            _model.insertIncompleteRow?.id,
          ),
        );
        logFirebaseEvent('homeNew_backend_call');
        _model.allPlacesResponse =
            await SupabasePublicGroup.getAllPlacesCall.call();
        if ((_model.allPlacesResponse?.succeeded ?? true)) {
          logFirebaseEvent('homeNew_backend_call');
          _model.distancesREsult = await GoogleDistanceMatrixCall.call(
            origin:
                '${_model.coordinates?.first?.toString()}, ${_model.coordinates?.last?.toString()}',
            destinationsSeparatedByPipe: getJsonField(
              (_model.allPlacesResponse?.jsonBody ?? ''),
              r'''$[:].placeCoordinates''',
            ).toString().toString(),
          );
          logFirebaseEvent('homeNew_backend_call');
          _model.latestUserLocationSaved = await UserLocationsTable().update(
            data: {
              'closest_place': valueOrDefault<String>(
                (SupabasePublicGroup.getAllPlacesCall.placeID(
                  (_model.allPlacesResponse?.jsonBody ?? ''),
                ) as List)
                        .map<String>((s) => s.toString())
                        .toList()[
                    functions.returnIndexClosestDistance(
                        GoogleDistanceMatrixCall.distanceMeters(
                  (_model.distancesREsult?.jsonBody ?? ''),
                )!
                            .take(100)
                            .toList()
                            .cast<int>()
                            .toList())],
                '1',
              ),
            },
            matchingRows: (rows) => rows.eq(
              'id',
              _model.insertIncompleteRow?.id,
            ),
            returnRows: true,
          );
        } else {
          return;
        }
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(GoogleMapsReverseGeocodingPrivateCall.call(
              latlng: valueOrDefault<String>(
                '${functions.extractLatLng(currentUserLocationValue!)?.first?.toString()},${functions.extractLatLng(currentUserLocationValue!)?.last?.toString()}',
                '38.7896702,-9.0965542',
              ),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 90.0,
                height: 90.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 90.0,
                ),
              ),
            ),
          );
        }
        final homeNewGoogleMapsReverseGeocodingPrivateResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FutureBuilder<List<PlacesRow>>(
              future: PlacesTable().querySingleRow(
                queryFn: (q) => q.eq(
                  'id',
                  valueOrDefault<String>(
                    _model.latestUserLocationSaved?.first?.closestPlace,
                    'dd73432b-b8e0-4219-b8a0-e284a2e1735a',
                  ),
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<PlacesRow> floatingActionButtonPlacesRowList =
                    snapshot.data!;
                final floatingActionButtonPlacesRow =
                    floatingActionButtonPlacesRowList.isNotEmpty
                        ? floatingActionButtonPlacesRowList.first
                        : null;
                return FloatingActionButton.extended(
                  onPressed: () async {
                    logFirebaseEvent(
                        'HOME_NEW_FloatingActionButton_x449hyyz_O');
                    logFirebaseEvent('FloatingActionButton_navigate_to');

                    context.pushNamed(
                      'createQuestion',
                      queryParameters: {
                        'place': serializeParam(
                          floatingActionButtonPlacesRow,
                          ParamType.SupabaseRow,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 200),
                        ),
                      },
                    );
                  },
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.maps_ugc,
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  elevation: 8.0,
                  label: Text(
                    'ASK',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                  ),
                );
              },
            ),
            drawer: Container(
              width: 300.0,
              child: Drawer(
                elevation: 16.0,
                child: wrapWithModel(
                  model: _model.drawerContentModel,
                  updateCallback: () => setState(() {}),
                  child: DrawerContentWidget(),
                ),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: true,
                actions: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                    child: FutureBuilder<List<ProfilesRow>>(
                      future: ProfilesTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'id',
                          currentUserUid,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ProfilesRow> rowProfileProfilesRowList =
                            snapshot.data!;
                        final rowProfileProfilesRow =
                            rowProfileProfilesRowList.isNotEmpty
                                ? rowProfileProfilesRowList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'HOME_NEW_PAGE_ContainerProfile_ON_TAP');
                                  if (currentUserUid != null &&
                                      currentUserUid != '') {
                                    logFirebaseEvent(
                                        'ContainerProfile_navigate_to');

                                    context.pushNamed(
                                      'profilePage',
                                      queryParameters: {
                                        'profile': serializeParam(
                                          rowProfileProfilesRow,
                                          ParamType.SupabaseRow,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    logFirebaseEvent(
                                        'ContainerProfile_navigate_to');

                                    context.goNamed(
                                      'createAccount',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 250),
                                        ),
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).info,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.7,
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.7,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      loggedIn
                                          ? rowProfileProfilesRow!.avatarUrl!
                                          : 'https://urbaned.tcnj.edu/wp-content/uploads/sites/85/2019/10/placeholder-profile-1-300x300.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
                centerTitle: true,
                elevation: 4.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Quests Near Me',
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onLongPress: () async {
                            logFirebaseEvent(
                                'HOME_NEW_Text_tgf61p2s_ON_LONG_PRESS');
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: LatLng(0.0, 0.0));
                            logFirebaseEvent('Text_copy_to_clipboard');
                            await Clipboard.setData(ClipboardData(
                                text: currentUserLocationValue!.toString()));
                          },
                          child: Text(
                            'You are @ ${'${functions.extractLatLng(currentUserLocationValue!)?.first?.toString()},${functions.extractLatLng(currentUserLocationValue!)?.last?.toString()}'}',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: GridView(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: 160.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'HOME_NEW_PAGE_Icon_fvmyqmw7_ON_TAP');
                                        logFirebaseEvent(
                                            'Icon_refresh_database_request');
                                        setState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: Icon(
                                        Icons.share_location,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 44.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: FutureBuilder<
                                          List<QueryUserPlacesRow>>(
                                        future:
                                            QueryUserPlacesTable().queryRows(
                                          queryFn: (q) => q.eq(
                                            'place',
                                            valueOrDefault<String>(
                                              _model.latestUserLocationSaved
                                                  ?.first?.closestPlace,
                                              'dd73432b-b8e0-4219-b8a0-e284a2e1735a',
                                            ),
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<QueryUserPlacesRow>
                                              questionCountQueryUserPlacesRowList =
                                              snapshot.data!;
                                          return Text(
                                            valueOrDefault<String>(
                                              '${questionCountQueryUserPlacesRowList.length.toString()} Questions',
                                              '0',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                ),
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      'near  ${GoogleMapsReverseGeocodingPrivateCall.resultArray(
                                            homeNewGoogleMapsReverseGeocodingPrivateResponse
                                                .jsonBody,
                                          ).length >= 1 ? GoogleMapsReverseGeocodingPrivateCall.formatedAddress(
                                          homeNewGoogleMapsReverseGeocodingPrivateResponse
                                              .jsonBody,
                                        ).toString() : GoogleMapsReverseGeocodingPrivateCall.compoundCode(
                                          homeNewGoogleMapsReverseGeocodingPrivateResponse
                                              .jsonBody,
                                        ).toString()}',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation1']!),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        'Trending in Area',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Container(
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x4D9489F5),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFF6F61EF),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  'Faith',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Container(
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x4C39D2C0),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFF39D2C0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  'Science',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Container(
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x4CEE8B60),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: Color(0xFFEE8B60),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  'Culture',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'wrapOnPageLoadAnimation']!),
                                  ],
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation2']!),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: 160.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Builder(builder: (context) {
                                final _googleMapMarker =
                                    currentUserLocationValue;
                                return FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController,
                                  onCameraIdle: (latLng) =>
                                      _model.googleMapsCenter = latLng,
                                  initialLocation: _model.googleMapsCenter ??=
                                      currentUserLocationValue!,
                                  markers: [
                                    if (_googleMapMarker != null)
                                      FlutterFlowMarker(
                                        _googleMapMarker.serialize(),
                                        _googleMapMarker,
                                      ),
                                  ],
                                  markerColor: GoogleMarkerColor.violet,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.silver,
                                  initialZoom: 15.0,
                                  allowInteraction: true,
                                  allowZoom: true,
                                  showZoomControls: false,
                                  showLocation: false,
                                  showCompass: false,
                                  showMapToolbar: false,
                                  showTraffic: false,
                                  centerMapOnMarkerTap: true,
                                );
                              }),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation3']!),
                            FutureBuilder<List<QueryUserPlacesRow>>(
                              future: QueryUserPlacesTable().querySingleRow(
                                queryFn: (q) => q.order('created_at'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<QueryUserPlacesRow>
                                    containerQueryUserPlacesRowList =
                                    snapshot.data!;
                                final containerQueryUserPlacesRow =
                                    containerQueryUserPlacesRowList.isNotEmpty
                                        ? containerQueryUserPlacesRowList.first
                                        : null;
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_NEW_PAGE_Container_hcr9e37o_ON_TAP');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      'questionDetail',
                                      queryParameters: {
                                        'queryUserPlace': serializeParam(
                                          containerQueryUserPlacesRow,
                                          ParamType.SupabaseRow,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                          duration: Duration(milliseconds: 300),
                                        ),
                                      },
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    height: 600.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x4C39D2C0),
                                      border: Border.all(
                                        color: Color(0xFF39D2C0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child:
                                                FutureBuilder<List<QueriesRow>>(
                                              future:
                                                  QueriesTable().querySingleRow(
                                                queryFn: (q) => q.eq(
                                                  'id',
                                                  containerQueryUserPlacesRow
                                                      ?.query,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<QueriesRow>
                                                    textQueriesRowList =
                                                    snapshot.data!;
                                                final textQueriesRow =
                                                    textQueriesRowList
                                                            .isNotEmpty
                                                        ? textQueriesRowList
                                                            .first
                                                        : null;
                                                return Text(
                                                  textQueriesRow!.title!
                                                      .maybeHandleOverflow(
                                                    maxChars: 55,
                                                    replacement: '…',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium,
                                                );
                                              },
                                            ),
                                          ),
                                          FutureBuilder<List<ProfilesRow>>(
                                            future:
                                                ProfilesTable().querySingleRow(
                                              queryFn: (q) => q.eq(
                                                'id',
                                                containerQueryUserPlacesRow
                                                    ?.userId,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ProfilesRow>
                                                  textProfilesRowList =
                                                  snapshot.data!;
                                              final textProfilesRow =
                                                  textProfilesRowList.isNotEmpty
                                                      ? textProfilesRowList
                                                          .first
                                                      : null;
                                              return Text(
                                                'by @${textProfilesRow?.username}',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation4']!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
