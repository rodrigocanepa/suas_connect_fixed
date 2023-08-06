import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/category_tag_card_widget.dart';
import '/components/comment_reply_edit_widget.dart';
import '/components/comment_reply_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'question_detail_model.dart';
export 'question_detail_model.dart';

class QuestionDetailWidget extends StatefulWidget {
  const QuestionDetailWidget({
    Key? key,
    required this.queryUserPlace,
  }) : super(key: key);

  final QueryUserPlacesRow? queryUserPlace;

  @override
  _QuestionDetailWidgetState createState() => _QuestionDetailWidgetState();
}

class _QuestionDetailWidgetState extends State<QuestionDetailWidget>
    with TickerProviderStateMixin {
  late QuestionDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          begin: Offset(0.0, -250.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
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
          begin: Offset(-10.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 50.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: Offset(-20.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
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
          begin: Offset(0.0, 80.0),
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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionDetailModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'questionDetail'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 230.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.0,
                            color: Color(0x17202529),
                            offset: Offset(0.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: FutureBuilder<List<PlacesRow>>(
                        future: PlacesTable().querySingleRow(
                          queryFn: (q) => q.eq(
                            'id',
                            widget.queryUserPlace?.place,
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
                          List<PlacesRow> stackPlacesRowList = snapshot.data!;
                          final stackPlacesRow = stackPlacesRowList.isNotEmpty
                              ? stackPlacesRowList.first
                              : null;
                          return Stack(
                            children: [
                              FlutterFlowStaticMap(
                                location: functions.convert2doublesToLatLngType(
                                    stackPlacesRow!.gpsCoordinates),
                                apiKey:
                                    'pk.eyJ1Ijoic3Vhc2RldiIsImEiOiJjbGtjdnZhMmEweWgzM2Rtd3p1eTY3OHllIn0.BnJ3aALRbuTPnBJe6dN6QQ',
                                style: MapBoxStyle.Outdoors,
                                width: double.infinity,
                                height: 300.0,
                                fit: BoxFit.cover,
                                borderRadius: BorderRadius.circular(0.0),
                                markerColor:
                                    FlutterFlowTheme.of(context).primary,
                                cached: true,
                                zoom: 14,
                                tilt: 0,
                                rotation: 0,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 40.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'QUESTION_DETAIL_arrow_back_ios_rounded_I');
                                            logFirebaseEvent(
                                                'IconButton_navigate_back');
                                            context.safePop();
                                          },
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 6.0, 8.0, 6.0),
                                                child: Text(
                                                  stackPlacesRow!.placeName!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: FutureBuilder<List<ProfilesRow>>(
                                        future: ProfilesTable().querySingleRow(
                                          queryFn: (q) => q.eq(
                                            'id',
                                            widget.queryUserPlace?.userId,
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
                                          List<ProfilesRow>
                                              rowUserAuthorProfilesRowList =
                                              snapshot.data!;
                                          final rowUserAuthorProfilesRow =
                                              rowUserAuthorProfilesRowList
                                                      .isNotEmpty
                                                  ? rowUserAuthorProfilesRowList
                                                      .first
                                                  : null;
                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'QUESTION_DETAIL_Card_cvj05mpk_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Card_navigate_to');

                                                  context.pushNamed(
                                                    'profilePage',
                                                    queryParameters: {
                                                      'profile': serializeParam(
                                                        rowUserAuthorProfilesRow,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 2.0,
                                                                2.0, 2.0),
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        rowUserAuthorProfilesRow!
                                                            .avatarUrl!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'QUESTION_DETAIL_Text_oepz47us_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_navigate_to');

                                                          context.pushNamed(
                                                            'profilePage',
                                                            queryParameters: {
                                                              'profile':
                                                                  serializeParam(
                                                                rowUserAuthorProfilesRow,
                                                                ParamType
                                                                    .SupabaseRow,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Text(
                                                          rowUserAuthorProfilesRow!
                                                              .username!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                          'MMMEd',
                                                          widget.queryUserPlace!
                                                              .createdAt!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Blinker',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_control_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 20.0, 16.0, 20.0),
                      child: FutureBuilder<List<QueriesRow>>(
                        future: QueriesTable().querySingleRow(
                          queryFn: (q) => q.eq(
                            'id',
                            widget.queryUserPlace?.query,
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
                          List<QueriesRow> columnQueryQueriesRowList =
                              snapshot.data!;
                          final columnQueryQueriesRow =
                              columnQueryQueriesRowList.isNotEmpty
                                  ? columnQueryQueriesRowList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 6.0, 0.0),
                                child: Text(
                                  columnQueryQueriesRow!.title!,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation1']!),
                              ),
                              wrapWithModel(
                                model: _model.categoryTagCardModel,
                                updateCallback: () => setState(() {}),
                                child: CategoryTagCardWidget(
                                  categoryId: widget.queryUserPlace?.category,
                                ),
                              ),
                              if ((columnQueryQueriesRow?.type == 1) &&
                                  (columnQueryQueriesRow?.content != null &&
                                      columnQueryQueriesRow?.content != ''))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 6.0, 6.0, 0.0),
                                  child: Text(
                                    columnQueryQueriesRow!.content!,
                                    textAlign: TextAlign.justify,
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation2']!),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 12.0, 6.0, 0.0),
                                child: FutureBuilder<List<QueryUserPlacesRow>>(
                                  future: (_model.requestCompleter3 ??=
                                          Completer<List<QueryUserPlacesRow>>()
                                            ..complete(QueryUserPlacesTable()
                                                .querySingleRow(
                                              queryFn: (q) => q.eq(
                                                'id',
                                                widget.queryUserPlace?.id,
                                              ),
                                            )))
                                      .future,
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<QueryUserPlacesRow>
                                        queryStatsQueryUserPlacesRowList =
                                        snapshot.data!;
                                    final queryStatsQueryUserPlacesRow =
                                        queryStatsQueryUserPlacesRowList
                                                .isNotEmpty
                                            ? queryStatsQueryUserPlacesRowList
                                                .first
                                            : null;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        FutureBuilder<List<UserVotesRow>>(
                                          future: (_model.requestCompleter2 ??=
                                                  Completer<
                                                      List<UserVotesRow>>()
                                                    ..complete(UserVotesTable()
                                                        .querySingleRow(
                                                      queryFn: (q) => q
                                                          .eq(
                                                            'question_id',
                                                            widget
                                                                .queryUserPlace
                                                                ?.id,
                                                          )
                                                          .eq(
                                                            'user_id',
                                                            currentUserUid,
                                                          ),
                                                    )))
                                              .future,
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
                                            List<UserVotesRow>
                                                rowVoteRElUserVotesRowList =
                                                snapshot.data!;
                                            final rowVoteRElUserVotesRow =
                                                rowVoteRElUserVotesRowList
                                                        .isNotEmpty
                                                    ? rowVoteRElUserVotesRowList
                                                        .first
                                                    : null;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (rowVoteRElUserVotesRow
                                                        ?.type ==
                                                    null)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'QUESTION_DETAIL_Icon_3w4xw0ge_ON_TAP');
                                                      if (loggedIn) {
                                                        logFirebaseEvent(
                                                            'Icon_backend_call');
                                                        await UserVotesTable()
                                                            .insert({
                                                          'user_id':
                                                              currentUserUid,
                                                          'question_id': widget
                                                              .queryUserPlace
                                                              ?.id,
                                                          'type': 1,
                                                        });
                                                        logFirebaseEvent(
                                                            'Icon_backend_call');
                                                        await QueryUserPlacesTable()
                                                            .update(
                                                          data: {
                                                            'score':
                                                                queryStatsQueryUserPlacesRow!
                                                                        .score! +
                                                                    1,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget
                                                                .queryUserPlace
                                                                ?.id,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Icon_refresh_database_request');
                                                        setState(() => _model
                                                                .requestCompleter2 =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted2();
                                                        logFirebaseEvent(
                                                            'Icon_refresh_database_request');
                                                        setState(() => _model
                                                                .requestCompleter3 =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted3();
                                                        return;
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons.thumb_up_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                if (rowVoteRElUserVotesRow
                                                        ?.type ==
                                                    1)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'QUESTION_DETAIL_Icon_sxuws9lg_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_backend_call');
                                                      await UserVotesTable()
                                                          .delete(
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id',
                                                          rowVoteRElUserVotesRow
                                                              ?.id,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Icon_backend_call');
                                                      await QueryUserPlacesTable()
                                                          .update(
                                                        data: {
                                                          'score':
                                                              queryStatsQueryUserPlacesRow!
                                                                      .score! -
                                                                  1,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'id',
                                                          widget.queryUserPlace
                                                              ?.id,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Icon_refresh_database_request');
                                                      setState(() => _model
                                                              .requestCompleter3 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted3();
                                                      logFirebaseEvent(
                                                          'Icon_refresh_database_request');
                                                      setState(() => _model
                                                              .requestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted2();
                                                    },
                                                    child: Icon(
                                                      Icons.thumb_up,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      queryStatsQueryUserPlacesRow
                                                          ?.score
                                                          ?.toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                if (rowVoteRElUserVotesRow
                                                        ?.type ==
                                                    null)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'QUESTION_DETAIL_Icon_gqfj0q0o_ON_TAP');
                                                        if (loggedIn) {
                                                          logFirebaseEvent(
                                                              'Icon_backend_call');
                                                          await UserVotesTable()
                                                              .insert({
                                                            'user_id':
                                                                currentUserUid,
                                                            'question_id': widget
                                                                .queryUserPlace
                                                                ?.id,
                                                            'type': -1,
                                                          });
                                                          logFirebaseEvent(
                                                              'Icon_backend_call');
                                                          await QueryUserPlacesTable()
                                                              .update(
                                                            data: {
                                                              'score':
                                                                  queryStatsQueryUserPlacesRow!
                                                                          .score! -
                                                                      1,
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'id',
                                                              widget
                                                                  .queryUserPlace
                                                                  ?.id,
                                                            ),
                                                          );
                                                          logFirebaseEvent(
                                                              'Icon_refresh_database_request');
                                                          setState(() => _model
                                                                  .requestCompleter2 =
                                                              null);
                                                          await _model
                                                              .waitForRequestCompleted2();
                                                          logFirebaseEvent(
                                                              'Icon_refresh_database_request');
                                                          setState(() => _model
                                                                  .requestCompleter3 =
                                                              null);
                                                          await _model
                                                              .waitForRequestCompleted3();
                                                          return;
                                                        } else {
                                                          return;
                                                        }
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .thumb_down_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                if (rowVoteRElUserVotesRow
                                                        ?.type ==
                                                    -1)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'QUESTION_DETAIL_Icon_dk72mkdz_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_backend_call');
                                                        await UserVotesTable()
                                                            .delete(
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            rowVoteRElUserVotesRow
                                                                ?.id,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Icon_backend_call');
                                                        await QueryUserPlacesTable()
                                                            .update(
                                                          data: {
                                                            'score':
                                                                queryStatsQueryUserPlacesRow!
                                                                        .score! +
                                                                    1,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget
                                                                .queryUserPlace
                                                                ?.id,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Icon_refresh_database_request');
                                                        setState(() => _model
                                                                .requestCompleter2 =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted2();
                                                        logFirebaseEvent(
                                                            'Icon_refresh_database_request');
                                                        setState(() => _model
                                                                .requestCompleter3 =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted3();
                                                      },
                                                      child: Icon(
                                                        Icons.thumb_down,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 0.0, 0.0),
                                          child: Icon(
                                            Icons.mode_comment_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            formatNumber(
                                              queryStatsQueryUserPlacesRow!
                                                  .commentsCount!,
                                              formatType: FormatType.compact,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'QUESTION_DETAIL_Icon_helgxhw5_ON_TAP');
                                                logFirebaseEvent('Icon_share');
                                                await Share.share(
                                                  'suas://suas.world${GoRouter.of(context).location}',
                                                  sharePositionOrigin:
                                                      getWidgetBoundingBox(
                                                          context),
                                                );
                                              },
                                              child: Icon(
                                                Icons.ios_share,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'QUESTION_DETAIL_Text_pn40scre_ON_TAP');
                                                logFirebaseEvent('Text_share');
                                                await Share.share(
                                                  'suas://suas.world${GoRouter.of(context).location}',
                                                  sharePositionOrigin:
                                                      getWidgetBoundingBox(
                                                          context),
                                                );
                                              },
                                              child: Text(
                                                'Share',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: FutureBuilder<List<CommentsRow>>(
                        future: (_model.requestCompleter1 ??=
                                Completer<List<CommentsRow>>()
                                  ..complete(CommentsTable().queryRows(
                                    queryFn: (q) => q
                                        .eq(
                                          'query_place',
                                          widget.queryUserPlace?.id,
                                        )
                                        .order('score')
                                        .order('created_at', ascending: true),
                                  )))
                            .future,
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
                          List<CommentsRow> columnCommentsCommentsRowList =
                              snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnCommentsCommentsRowList.length,
                                (columnCommentsIndex) {
                              final columnCommentsCommentsRow =
                                  columnCommentsCommentsRowList[
                                      columnCommentsIndex];
                              return Visibility(
                                visible: !FFAppState()
                                    .blockedUsers
                                    .contains(columnCommentsCommentsRow.userId),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 16.0, 24.0, 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FutureBuilder<List<ProfilesRow>>(
                                          future:
                                              ProfilesTable().querySingleRow(
                                            queryFn: (q) => q.eq(
                                              'id',
                                              columnCommentsCommentsRow.userId,
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
                                                commenterProfileProfilesRowList =
                                                snapshot.data!;
                                            final commenterProfileProfilesRow =
                                                commenterProfileProfilesRowList
                                                        .isNotEmpty
                                                    ? commenterProfileProfilesRowList
                                                        .first
                                                    : null;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'QUESTION_DETAIL_Image_xxb31u3h_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Image_navigate_to');

                                                    context.pushNamed(
                                                      'profilePage',
                                                      queryParameters: {
                                                        'profile':
                                                            serializeParam(
                                                          commenterProfileProfilesRow,
                                                          ParamType.SupabaseRow,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                    child: Image.network(
                                                      commenterProfileProfilesRow!
                                                          .avatarUrl!,
                                                      width: 40.0,
                                                      height: 40.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            commenterProfileProfilesRow
                                                                ?.username,
                                                            'o',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        if (commenterProfileProfilesRow
                                                                ?.expert ??
                                                            true)
                                                          GradientText(
                                                            'EXPERT',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Blinker',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                            colors: [
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary
                                                            ],
                                                            gradientDirection:
                                                                GradientDirection
                                                                    .btt,
                                                            gradientType:
                                                                GradientType
                                                                    .linear,
                                                          ),
                                                        Text(
                                                          dateTimeFormat(
                                                            'M/d h:mm a',
                                                            columnCommentsCommentsRow
                                                                .createdAt!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if (columnCommentsCommentsRow
                                                        .userId ==
                                                    currentUserUid)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.edit_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'QUESTION_DETAIL_edit_sharp_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => FocusScope
                                                                    .of(context)
                                                                .requestFocus(_model
                                                                    .unfocusNode),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: 210.0,
                                                                child:
                                                                    CommentReplyEditWidget(
                                                                  comment:
                                                                      columnCommentsCommentsRow,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            columnCommentsCommentsRow.content!,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child:
                                              FutureBuilder<List<UserVotesRow>>(
                                            future:
                                                UserVotesTable().querySingleRow(
                                              queryFn: (q) => q
                                                  .eq(
                                                    'comment_id',
                                                    columnCommentsCommentsRow
                                                        .id,
                                                  )
                                                  .eq(
                                                    'user_id',
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
                                              List<UserVotesRow>
                                                  commentStatsUserVotesRowList =
                                                  snapshot.data!;
                                              final commentStatsUserVotesRow =
                                                  commentStatsUserVotesRowList
                                                          .isNotEmpty
                                                      ? commentStatsUserVotesRowList
                                                          .first
                                                      : null;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (commentStatsUserVotesRow
                                                              ?.id ==
                                                          null)
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'QUESTION_DETAIL_Icon_havhndpb_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Icon_backend_call');
                                                            await UserVotesTable()
                                                                .insert({
                                                              'user_id':
                                                                  currentUserUid,
                                                              'type': 1,
                                                              'comment_id':
                                                                  columnCommentsCommentsRow
                                                                      .id,
                                                              'created_at':
                                                                  supaSerialize<
                                                                          DateTime>(
                                                                      getCurrentTimestamp),
                                                            });
                                                            logFirebaseEvent(
                                                                'Icon_backend_call');
                                                            await CommentsTable()
                                                                .update(
                                                              data: {
                                                                'score':
                                                                    columnCommentsCommentsRow
                                                                            .score! +
                                                                        1,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'id',
                                                                columnCommentsCommentsRow
                                                                    .id,
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'Icon_refresh_database_request');
                                                            setState(() => _model
                                                                    .requestCompleter1 =
                                                                null);
                                                            await _model
                                                                .waitForRequestCompleted1();
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .thumb_up_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      if (commentStatsUserVotesRow
                                                              ?.type ==
                                                          1)
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'QUESTION_DETAIL_Icon_ii22h51s_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Icon_backend_call');
                                                            await UserVotesTable()
                                                                .delete(
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'id',
                                                                commentStatsUserVotesRow
                                                                    ?.id,
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'Icon_backend_call');
                                                            await CommentsTable()
                                                                .update(
                                                              data: {
                                                                'score':
                                                                    columnCommentsCommentsRow
                                                                            .score! -
                                                                        1,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'id',
                                                                columnCommentsCommentsRow
                                                                    .id,
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'Icon_refresh_database_request');
                                                            setState(() => _model
                                                                    .requestCompleter1 =
                                                                null);
                                                            await _model
                                                                .waitForRequestCompleted1();
                                                          },
                                                          child: Icon(
                                                            Icons.thumb_up,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnCommentsCommentsRow
                                                                .score
                                                                ?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      if (commentStatsUserVotesRow
                                                              ?.type ==
                                                          null)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'QUESTION_DETAIL_Icon_91sl9tqp_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Icon_backend_call');
                                                              await UserVotesTable()
                                                                  .insert({
                                                                'user_id':
                                                                    currentUserUid,
                                                                'type': -1,
                                                                'comment_id':
                                                                    columnCommentsCommentsRow
                                                                        .id,
                                                              });
                                                              logFirebaseEvent(
                                                                  'Icon_backend_call');
                                                              await CommentsTable()
                                                                  .update(
                                                                data: {
                                                                  'score':
                                                                      columnCommentsCommentsRow
                                                                              .score! -
                                                                          1,
                                                                },
                                                                matchingRows:
                                                                    (rows) =>
                                                                        rows.eq(
                                                                  'id',
                                                                  columnCommentsCommentsRow
                                                                      .id,
                                                                ),
                                                              );
                                                              logFirebaseEvent(
                                                                  'Icon_refresh_database_request');
                                                              setState(() =>
                                                                  _model.requestCompleter1 =
                                                                      null);
                                                              await _model
                                                                  .waitForRequestCompleted1();
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .thumb_down_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                      if (commentStatsUserVotesRow
                                                              ?.type ==
                                                          -1)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'QUESTION_DETAIL_Icon_unneets9_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Icon_backend_call');
                                                              await UserVotesTable()
                                                                  .delete(
                                                                matchingRows:
                                                                    (rows) =>
                                                                        rows.eq(
                                                                  'id',
                                                                  commentStatsUserVotesRow
                                                                      ?.id,
                                                                ),
                                                              );
                                                              logFirebaseEvent(
                                                                  'Icon_backend_call');
                                                              await CommentsTable()
                                                                  .update(
                                                                data: {
                                                                  'score':
                                                                      columnCommentsCommentsRow
                                                                              .score! +
                                                                          1,
                                                                },
                                                                matchingRows:
                                                                    (rows) =>
                                                                        rows.eq(
                                                                  'id',
                                                                  columnCommentsCommentsRow
                                                                      .id,
                                                                ),
                                                              );
                                                              logFirebaseEvent(
                                                                  'Icon_refresh_database_request');
                                                              setState(() =>
                                                                  _model.requestCompleter1 =
                                                                      null);
                                                              await _model
                                                                  .waitForRequestCompleted1();
                                                            },
                                                            child: Icon(
                                                              Icons.thumb_down,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        if (false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                        child: Image.network(
                                                          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                          width: 40.0,
                                                          height: 40.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.75,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Randy Alcorn',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'I\'m not really sure about this section here aI think you should do soemthing cool!',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'a min ago',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation']!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'QUESTION_DETAIL_WRITE_A_REPLY_BTN_ON_TAP');
                        logFirebaseEvent('Button_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          enableDrag: false,
                          useSafeArea: true,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height: 260.0,
                                  child: CommentReplyWidget(
                                    queryPlace: widget.queryUserPlace,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        logFirebaseEvent('Button_refresh_database_request');
                        setState(() => _model.requestCompleter1 = null);
                        await _model.waitForRequestCompleted1();
                      },
                      text: 'Write a Reply',
                      icon: Icon(
                        Icons.edit_outlined,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation2']!),
          ],
        ),
      ),
    );
  }
}
