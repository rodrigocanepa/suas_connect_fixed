import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/block_user_copy/block_user_copy_widget.dart';
import '/components/category_tag_card_widget.dart';
import '/components/drawer_content_widget.dart';
import '/components/empty_list_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'feed'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FutureBuilder<List<PlacesRow>>(
        future: PlacesTable().querySingleRow(
          queryFn: (q) => q.eq(
            'id',
            'dd73432b-b8e0-4219-b8a0-e284a2e1735a',
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
          List<PlacesRow> floatingActionButtonPlacesRowList = snapshot.data!;
          final floatingActionButtonPlacesRow =
              floatingActionButtonPlacesRowList.isNotEmpty
                  ? floatingActionButtonPlacesRowList.first
                  : null;
          return FloatingActionButton.extended(
            onPressed: () async {
              logFirebaseEvent('FEED_FloatingActionButton_w9kgeex7_ON_TA');
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
      drawer: Drawer(
        elevation: 16.0,
        child: wrapWithModel(
          model: _model.drawerContentModel,
          updateCallback: () => setState(() {}),
          child: DrawerContentWidget(),
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: true,
        title: Image.asset(
          'assets/images/logo_suas_fitted.png',
          width: 120.0,
          height: 30.0,
          fit: BoxFit.cover,
        ),
        actions: [],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 12.0),
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
                    List<ProfilesRow> rowProfilesRowList = snapshot.data!;
                    final rowProfilesRow = rowProfilesRowList.isNotEmpty
                        ? rowProfilesRowList.first
                        : null;
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('FEED_PAGE_Row_xiy76ucp_ON_TAP');
                        logFirebaseEvent('Row_navigate_to');

                        context.pushNamed(
                          'profilePage',
                          queryParameters: {
                            'profile': serializeParam(
                              rowProfilesRow,
                              ParamType.SupabaseRow,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 2.0, 2.0, 2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 0),
                                  fadeOutDuration: Duration(milliseconds: 0),
                                  imageUrl: rowProfilesRow!.avatarUrl!,
                                  width: 60.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Hello, ',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 0.0, 0.0, 0.0),
                            child: GradientText(
                              rowProfilesRow!.name!,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).info,
                                FlutterFlowTheme.of(context).primary
                              ],
                              gradientDirection: GradientDirection.ttb,
                              gradientType: GradientType.linear,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 6.0),
                child: FutureBuilder<List<SettingsRow>>(
                  future: SettingsTable().querySingleRow(
                    queryFn: (q) => q,
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
                    List<SettingsRow> richTextSettingsRowList = snapshot.data!;
                    final richTextSettingsRow =
                        richTextSettingsRowList.isNotEmpty
                            ? richTextSettingsRowList.first
                            : null;
                    return RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: richTextSettingsRow!.welcomeMessageStart!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          TextSpan(
                            text: richTextSettingsRow!.welcomeMessageEnd!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF388E3C),
                                  fontWeight: FontWeight.bold,
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    );
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FutureBuilder<List<QueryUserPlacesRow>>(
                    future: QueryUserPlacesTable().queryRows(
                      queryFn: (q) => q.order('score').order('created_at'),
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
                      List<QueryUserPlacesRow> listViewQueryUserPlacesRowList =
                          snapshot.data!;
                      if (listViewQueryUserPlacesRowList.isEmpty) {
                        return Center(
                          child: EmptyListPostWidget(),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewQueryUserPlacesRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewQueryUserPlacesRow =
                              listViewQueryUserPlacesRowList[listViewIndex];
                          return Visibility(
                            visible: !FFAppState()
                                .blockedUsers
                                .contains(listViewQueryUserPlacesRow.userId),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: FutureBuilder<List<QueriesRow>>(
                                future: QueriesTable().querySingleRow(
                                  queryFn: (q) => q.eq(
                                    'id',
                                    listViewQueryUserPlacesRow.query,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<QueriesRow>
                                      containerQueryContentQueriesRowList =
                                      snapshot.data!;
                                  final containerQueryContentQueriesRow =
                                      containerQueryContentQueriesRowList
                                              .isNotEmpty
                                          ? containerQueryContentQueriesRowList
                                              .first
                                          : null;
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'FEED_PAGE_ContainerQueryContent_ON_TAP');
                                      logFirebaseEvent(
                                          'ContainerQueryContent_navigate_to');

                                      context.pushNamed(
                                        'questionDetail',
                                        queryParameters: {
                                          'queryUserPlace': serializeParam(
                                            listViewQueryUserPlacesRow,
                                            ParamType.SupabaseRow,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x32000000),
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: FutureBuilder<List<ProfilesRow>>(
                                        future: ProfilesTable().querySingleRow(
                                          queryFn: (q) => q.eq(
                                            'id',
                                            listViewQueryUserPlacesRow.userId,
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
                                              rowProfileProfilesRowList =
                                              snapshot.data!;
                                          final rowProfileProfilesRow =
                                              rowProfileProfilesRowList
                                                      .isNotEmpty
                                                  ? rowProfileProfilesRowList
                                                      .first
                                                  : null;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              if (valueOrDefault<bool>(
                                                containerQueryContentQueriesRow
                                                        ?.type ==
                                                    2,
                                                false,
                                              ))
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        'https://picsum.photos/seed/544/600',
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 12.0, 0.0, 12.0),
                                                child: Container(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    rowProfileProfilesRow!
                                                        .avatarUrl!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 8.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                rowProfileProfilesRow
                                                                    ?.username,
                                                                'no',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'on',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                            Text(
                                                              dateTimeFormat(
                                                                'MMMEd',
                                                                listViewQueryUserPlacesRow
                                                                    .createdAt!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 3.0)),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      3.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            containerQueryContentQueriesRow!
                                                                .title!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    3.0),
                                                        child:
                                                            CategoryTagCardWidget(
                                                          key: Key(
                                                              'Key8j9_${listViewIndex}_of_${listViewQueryUserPlacesRowList.length}'),
                                                          categoryId:
                                                              listViewQueryUserPlacesRow
                                                                  .category,
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 2.0)),
                                                  ),
                                                ),
                                              ),
                                              if (valueOrDefault<bool>(
                                                listViewQueryUserPlacesRow
                                                        .userId !=
                                                    currentUserUid,
                                                false,
                                              ))
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 36.0,
                                                    icon: Icon(
                                                      Icons.more_vert,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'FEED_PAGE_more_vert_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: 260.0,
                                                              child:
                                                                  BlockUserCopyWidget(
                                                                query:
                                                                    listViewQueryUserPlacesRow,
                                                                profile:
                                                                    rowProfileProfilesRow!,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
