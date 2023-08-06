import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_profile1_model.dart';
export 'create_profile1_model.dart';

class CreateProfile1Widget extends StatefulWidget {
  const CreateProfile1Widget({Key? key}) : super(key: key);

  @override
  _CreateProfile1WidgetState createState() => _CreateProfile1WidgetState();
}

class _CreateProfile1WidgetState extends State<CreateProfile1Widget> {
  late CreateProfile1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProfile1Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createProfile1'});
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Complete your Profile',
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 24.0, 0.0),
            child: Text(
              '1/2',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            '🚀 To curate a personalized journey for you, let\'s dive into your interests. 🤓 Select the categories of learning you\'re passionate about.',
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Categories',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                  Container(
                    height: 400.0,
                    decoration: BoxDecoration(),
                    child: FutureBuilder<List<CategoriesRow>>(
                      future: CategoriesTable().queryRows(
                        queryFn: (q) => q.order('name', ascending: true),
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
                        List<CategoriesRow>
                            listViewCategoriesCategoriesRowList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewCategoriesCategoriesRowList.length,
                          itemBuilder: (context, listViewCategoriesIndex) {
                            final listViewCategoriesCategoriesRow =
                                listViewCategoriesCategoriesRowList[
                                    listViewCategoriesIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.selectedCategoriesIDs.contains(
                                      listViewCategoriesCategoriesRow.id)){
                                    logFirebaseEvent(
                                        'CREATE_PROFILE1_Icon_n6qrn6bf_ON_TAP');
                                    logFirebaseEvent(
                                        'Icon_update_widget_state');
                                    setState(() {
                                      _model.removeFromSelectedCategoriesIDs(
                                          listViewCategoriesCategoriesRow
                                              .id);
                                    });
                                  } else{
                                    logFirebaseEvent(
                                        'CREATE_PROFILE1_Icon_7qfe4d5x_ON_TAP');
                                    logFirebaseEvent(
                                        'Icon_update_widget_state');
                                    setState(() {
                                      _model.addToSelectedCategoriesIDs(
                                          listViewCategoriesCategoriesRow
                                              .id);
                                    });
                                  }

                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent4,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 12.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            listViewCategoriesCategoriesRow.emoji,
                                            'test',
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Blinker',
                                            fontSize: 32.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewCategoriesCategoriesRow
                                                      .name!,
                                                  style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color:
                                                                Color(0xFF14181B),
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 4.0, 0.0, 0.0),
                                                    child: Text(
                                                      listViewCategoriesCategoriesRow
                                                          .description!,
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 12.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (!_model.selectedCategoriesIDs
                                            .contains(
                                                listViewCategoriesCategoriesRow
                                                    .id))
                                          Icon(
                                            Icons.favorite_border,
                                            color: Color(0xFF57636C),
                                            size: 24.0,
                                          ),
                                        if (_model.selectedCategoriesIDs.contains(
                                            listViewCategoriesCategoriesRow.id))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'CREATE_PROFILE1_Icon_n6qrn6bf_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_update_widget_state');
                                              setState(() {
                                                _model.removeFromSelectedCategoriesIDs(
                                                    listViewCategoriesCategoriesRow
                                                        .id);
                                              });
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              color: FlutterFlowTheme.of(context)
                                                  .primary,
                                              size: 24.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 20.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You can change this later in your profile.',
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREATE_PROFILE1_PAGE_SKIP_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'createYourProfile2',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 200),
                                ),
                              },
                            );
                          },
                          text: 'Skip',
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREATE_PROFILE1_SAVE_&_CONTINUE_BTN_ON_T');
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Saving Categories',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Blinker',
                                        color: FlutterFlowTheme.of(context)
                                            .dark600,
                                      ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF39D2C0),
                              ),
                            );
                            logFirebaseEvent('Button_start_periodic_action');
                            _model.addCategoriesUSerLoop =
                                InstantTimer.periodic(
                              duration: Duration(milliseconds: 1000),
                              callback: (timer) async {
                                if (_model.loopCounterSelectedCategories <
                                    valueOrDefault<int>(
                                      _model.selectedCategoriesIDs.length,
                                      0,
                                    )) {
                                  logFirebaseEvent('Button_backend_call');
                                  await UserCategoriesTable().insert({
                                    'user_id': currentUserUid,
                                    'category': _model.selectedCategoriesIDs[
                                        _model.loopCounterSelectedCategories],
                                  });
                                  logFirebaseEvent(
                                      'Button_update_widget_state');
                                  setState(() {
                                    _model.loopCounterSelectedCategories =
                                        _model.loopCounterSelectedCategories +
                                            1;
                                  });
                                } else {
                                  logFirebaseEvent(
                                      'Button_stop_periodic_action');
                                  _model.addCategoriesUSerLoop?.cancel();
                                  logFirebaseEvent('Button_navigate_to');

                                  context.goNamed(
                                    'createYourProfile2',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                        duration: Duration(milliseconds: 200),
                                      ),
                                    },
                                  );
                                }
                              },
                              startImmediately: true,
                            );
                          },
                          text: 'Save & Continue',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ].divide(SizedBox(width: 20.0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
