import '/auth/base_auth_user_provider.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/block_user/block_user_widget.dart';
import '/components/category_tag_card_widget.dart';
import '/components/empty_list_post_widget.dart';
import '/components/unfollow/unfollow_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({
    Key? key,
    this.profile,
  }) : super(key: key);

  final ProfilesRow? profile;

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'profilePage'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<FollowsUsersRow>>(
      future: (_model.requestCompleter ??= Completer<List<FollowsUsersRow>>()
            ..complete(FollowsUsersTable().querySingleRow(
              queryFn: (q) => q
                  .eq(
                    'user',
                    widget.profile?.id,
                  )
                  .eq(
                    'follower',
                    currentUserUid,
                  ),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
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
        List<FollowsUsersRow> profilePageFollowsUsersRowList = snapshot.data!;
        final profilePageFollowsUsersRow =
            profilePageFollowsUsersRowList.isNotEmpty
                ? profilePageFollowsUsersRowList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('PROFILE_arrow_back_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: Text(
                'Profile',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [
                Visibility(
                  visible: (widget.profile?.id != currentUserUid) &&
                      !FFAppState().blockedUsers.contains(widget.profile?.id),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 12.0,
                      borderWidth: 0.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.more_vert,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 14.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'PROFILE_PAGE_PAGE_more_vert_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
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
                                  height: 190.0,
                                  child: BlockUserWidget(
                                    profile: widget.profile!,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.85, 0.68),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(90.0),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.85, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 4.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PROFILE_CircleImage_yu4q5qu9_ON_TAP');
                                            logFirebaseEvent(
                                                'CircleImage_expand_image');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    widget.profile!.avatarUrl!,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: widget
                                                      .profile!.avatarUrl!,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: widget.profile!.avatarUrl!,
                                            transitionOnUserGestures: true,
                                            child: Container(
                                              width: 90.0,
                                              height: 90.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                widget.profile!.avatarUrl!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14.0, 0.0, 24.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.profile?.name,
                                              'name',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge,
                                          ),
                                          if (widget.profile?.expert ?? true)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: GradientText(
                                                'EXPERT',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Blinker',
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                  FlutterFlowTheme.of(context)
                                                      .secondary
                                                ],
                                                gradientDirection:
                                                    GradientDirection.btt,
                                                gradientType:
                                                    GradientType.linear,
                                              ),
                                            ),
                                          if (widget.profile?.expert ?? true)
                                            Icon(
                                              Icons.wifi_tethering_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: SelectionArea(
                                            child: Text(
                                          '@${valueOrDefault<String>(
                                            widget.profile?.username,
                                            'nousername',
                                          )}',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        )),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.profile?.bio != null &&
                                                      widget.profile?.bio != ''
                                                  ? valueOrDefault<String>(
                                                      widget.profile?.bio,
                                                      'nobio',
                                                    )
                                                  : 'no bio provided',
                                              'no bio provided',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.profile?.quests?.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Blinker',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              'Quests',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Blinker',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.profile?.learners?.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Blinker',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              'Learners',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Blinker',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.profile?.instructors?.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Blinker',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              'Instructors',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Blinker',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                  if (FFAppState().blockedUsers.contains(widget.profile?.id))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (widget.profile?.id != currentUserUid)
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'PROFILE_PAGE_PAGE_ButtonFollow_ON_TAP');
                                  logFirebaseEvent('ButtonFollow_backend_call');
                                  await UserBlocksTable().delete(
                                    matchingRows: (rows) => rows
                                        .eq(
                                          'profile_blocked',
                                          widget.profile?.id,
                                        )
                                        .eq(
                                          'user_id',
                                          currentUserUid,
                                        ),
                                  );
                                  logFirebaseEvent(
                                      'ButtonFollow_update_app_state');
                                  FFAppState().update(() {
                                    FFAppState().removeFromBlockedUsers(
                                        widget.profile!.id);
                                  });
                                },
                                text: 'Unblock user',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  if (valueOrDefault<bool>(
                        profilePageFollowsUsersRow?.id == null,
                        false,
                      ) &&
                      !valueOrDefault<bool>(
                        FFAppState().blockedUsers.contains(widget.profile?.id),
                        true,
                      ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (widget.profile?.id != currentUserUid)
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PROFILE_PAGE_PAGE_ButtonFollow_ON_TAP');
                                if (loggedIn) {
                                  logFirebaseEvent('ButtonFollow_backend_call');
                                  await FollowsUsersTable().insert({
                                    'user': widget.profile?.id,
                                    'follower': currentUserUid,
                                  });
                                  logFirebaseEvent(
                                      'ButtonFollow_refresh_database_request');
                                  setState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted(
                                      minWait: 300);
                                } else {
                                  logFirebaseEvent(
                                      'ButtonFollow_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Login to Follow this User',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Blinker',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }
                              },
                              text: 'Learn',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          if (widget.profile?.id == currentUserUid)
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PROFILE_EDIT_PROFILE_BTN_ON_TAP');
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed(
                                  'editUserProfile',
                                  queryParameters: {
                                    'userProfile': serializeParam(
                                      widget.profile,
                                      ParamType.SupabaseRow,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Edit Profile',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                        ],
                      ),
                    ),
                  if (valueOrDefault<bool>(
                        profilePageFollowsUsersRow?.id != null,
                        true,
                      ) &&
                      !valueOrDefault<bool>(
                        FFAppState().blockedUsers.contains(widget.profile?.id),
                        false,
                      ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (widget.profile?.id != currentUserUid)
                            Opacity(
                              opacity: 0.8,
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('ButtonFollow pressed ...');
                                },
                                text: 'Following',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PROFILE_PAGE_PAGE_+_BTN_ON_TAP');
                                logFirebaseEvent('Button_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => FocusScope.of(context)
                                          .requestFocus(_model.unfocusNode),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: 190.0,
                                          child: UnfollowWidget(
                                            followUser:
                                                profilePageFollowsUsersRow!,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                logFirebaseEvent(
                                    'Button_refresh_database_request');
                                setState(() => _model.requestCompleter = null);
                                await _model.waitForRequestCompleted();
                              },
                              text: '+',
                              options: FFButtonOptions(
                                width: 40.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    child: DefaultTabController(
                      length: 1,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor: FlutterFlowTheme.of(context).primary,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle:
                                  FlutterFlowTheme.of(context).titleSmall,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              indicatorWeight: 2.0,
                              tabs: [
                                Tab(
                                  text: 'Quests',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Visibility(
                                    visible: !FFAppState()
                                        .blockedUsers
                                        .contains(widget.profile?.id),
                                    child:
                                        FutureBuilder<List<QueryUserPlacesRow>>(
                                      future: QueryUserPlacesTable().queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'user_id',
                                              widget.profile?.id,
                                            )
                                            .order('created_at'),
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
                                            listViewQueryUserPlacesRowList =
                                            snapshot.data!;
                                        if (listViewQueryUserPlacesRowList
                                            .isEmpty) {
                                          return Center(
                                            child: EmptyListPostWidget(),
                                          );
                                        }
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewQueryUserPlacesRowList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewQueryUserPlacesRow =
                                                listViewQueryUserPlacesRowList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 16.0, 0.0),
                                              child: FutureBuilder<
                                                  List<QueriesRow>>(
                                                future: QueriesTable()
                                                    .querySingleRow(
                                                  queryFn: (q) => q.eq(
                                                    'id',
                                                    listViewQueryUserPlacesRow
                                                        .query,
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
                                                      containerQueriesRowList =
                                                      snapshot.data!;
                                                  final containerQueriesRow =
                                                      containerQueriesRowList
                                                              .isNotEmpty
                                                          ? containerQueriesRowList
                                                              .first
                                                          : null;
                                                  return InkWell(
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
                                                          'PROFILE_Container_bd2e95p5_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_navigate_to');

                                                      context.pushNamed(
                                                        'questionDetail',
                                                        queryParameters: {
                                                          'queryUserPlace':
                                                              serializeParam(
                                                            listViewQueryUserPlacesRow,
                                                            ParamType
                                                                .SupabaseRow,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .bottomToTop,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3.0,
                                                            color: Color(
                                                                0x32000000),
                                                            offset: Offset(
                                                                0.0, 1.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (valueOrDefault<
                                                              bool>(
                                                            containerQueriesRow
                                                                    ?.type ==
                                                                2,
                                                            false,
                                                          ))
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fadeInDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                fadeOutDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                imageUrl:
                                                                    'https://picsum.photos/seed/544/600',
                                                                width: 100.0,
                                                                height: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      'MMMEd',
                                                                      listViewQueryUserPlacesRow
                                                                          .createdAt!,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                  Flexible(
                                                                    child: Text(
                                                                      containerQueriesRow!
                                                                          .title!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child:
                                                                        CategoryTagCardWidget(
                                                                      key: Key(
                                                                          'Keyz07_${listViewIndex}_of_${listViewQueryUserPlacesRowList.length}'),
                                                                      categoryId:
                                                                          listViewQueryUserPlacesRow
                                                                              .category,
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        2.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          if (valueOrDefault<
                                                              bool>(
                                                            listViewQueryUserPlacesRow
                                                                    .userId ==
                                                                currentUserUid,
                                                            false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent3,
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    2.0,
                                                                buttonSize:
                                                                    44.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .edit_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'PROFILE_edit_outlined_ICN_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'IconButton_navigate_to');

                                                                  context
                                                                      .pushNamed(
                                                                    'createQuestionCopy',
                                                                    queryParameters:
                                                                        {
                                                                      'question':
                                                                          serializeParam(
                                                                        listViewQueryUserPlacesRow,
                                                                        ParamType
                                                                            .SupabaseRow,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
