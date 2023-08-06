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
import 'create_account_expert_model.dart';
export 'create_account_expert_model.dart';

class CreateAccountExpertWidget extends StatefulWidget {
  const CreateAccountExpertWidget({
    Key? key,
    this.mentorCode,
  }) : super(key: key);

  final String? mentorCode;

  @override
  _CreateAccountExpertWidgetState createState() =>
      _CreateAccountExpertWidgetState();
}

class _CreateAccountExpertWidgetState extends State<CreateAccountExpertWidget> {
  late CreateAccountExpertModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAccountExpertModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createAccountExpert'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATE_ACCOUNT_EXPERT_createAccountExper');
      if (widget.mentorCode != null && widget.mentorCode != '') {
        logFirebaseEvent('createAccountExpert_backend_call');
        _model.returnedCode =
            await SupabasePublicGroup.mentorSignupCheckCall.call();
        if ((_model.returnedCode?.succeeded ?? true) &&
            SupabasePublicGroup.mentorSignupCheckCall.active(
              (_model.returnedCode?.jsonBody ?? ''),
            ) &&
            (widget.mentorCode ==
                SupabasePublicGroup.mentorSignupCheckCall.code(
                  (_model.returnedCode?.jsonBody ?? ''),
                ))) {
          logFirebaseEvent('createAccountExpert_update_app_state');
          setState(() {
            FFAppState().isMentor = true;
          });
        } else {
          logFirebaseEvent('createAccountExpert_update_app_state');
          setState(() {
            FFAppState().isMentor = false;
          });
        }

        return;
      } else {
        logFirebaseEvent('createAccountExpert_update_app_state');
        setState(() {
          FFAppState().isMentor = false;
        });
        return;
      }
    });

    _model.emailSignupController ??= TextEditingController();
    _model.passwordSignupController ??= TextEditingController();
    _model.passwordconfirmController ??= TextEditingController();
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                  'https://xppspwqennohzbutsnrc.supabase.co/storage/v1/object/public/public/assets/landing.png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Image.asset(
                          'assets/images/logo_suas_fitted.png',
                          width: 140.0,
                          height: 40.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x001A1F24),
                        FlutterFlowTheme.of(context).primaryBackground
                      ],
                      stops: [0.0, 0.3],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.8),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 40.0, 20.0, 45.0),
                      child: FutureBuilder<List<SettingsRow>>(
                        future: SettingsTable().querySingleRow(
                          queryFn: (q) => q.eq(
                            'id',
                            1,
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
                          List<SettingsRow> columnSettingsRowList =
                              snapshot.data!;
                          final columnSettingsRow =
                              columnSettingsRowList.isNotEmpty
                                  ? columnSettingsRowList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Register in SUAS,',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 250.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC4F5C6),
                                    border: Border.all(
                                      color: Color(0xFF66BB6A),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6.0, 6.0, 6.0, 6.0),
                                    child: Text(
                                      'You have been invited as Expert!',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Blinker',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Create your Account or  ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Login',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          logFirebaseEvent(
                                              'CREATE_ACCOUNT_EXPERT_RichTextSpan_pofkk');
                                          logFirebaseEvent(
                                              'RichTextSpan_navigate_to');

                                          context.pushNamed('login');
                                        },
                                    )
                                  ],
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              TextFormField(
                                controller: _model.emailSignupController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: FlutterFlowTheme.of(context).accent3,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.emailSignupControllerValidator
                                    .asValidator(context),
                              ),
                              TextFormField(
                                controller: _model.passwordSignupController,
                                obscureText: !_model.passwordSignupVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Set your Password',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  prefixIcon: Icon(
                                    Icons.vpn_key_sharp,
                                    color: FlutterFlowTheme.of(context).accent3,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.passwordSignupVisibility =
                                          !_model.passwordSignupVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.passwordSignupVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model
                                    .passwordSignupControllerValidator
                                    .asValidator(context),
                              ),
                              TextFormField(
                                controller: _model.passwordconfirmController,
                                obscureText: !_model.passwordconfirmVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Confirm your Password',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  prefixIcon: Icon(
                                    Icons.vpn_key_sharp,
                                    color: FlutterFlowTheme.of(context).accent3,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.passwordconfirmVisibility =
                                          !_model.passwordconfirmVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.passwordconfirmVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model
                                    .passwordconfirmControllerValidator
                                    .asValidator(context),
                              ),
                              if (_model.passwordMismatch == true)
                                Text(
                                  'Passwords don\'t match',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Blinker',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FFButtonWidget(
                                    onPressed: !columnSettingsRow!
                                            .signupsEnabled
                                        ? null
                                        : () async {
                                            logFirebaseEvent(
                                                'CREATE_ACCOUNT_EXPERT_CREATE_ACCOUNT_BTN');
                                            logFirebaseEvent(
                                                'Button_validate_form');
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            logFirebaseEvent(
                                                'Button_update_widget_state');
                                            setState(() {
                                              _model.passwordMismatch = _model
                                                      .passwordSignupController
                                                      .text !=
                                                  _model
                                                      .passwordconfirmController
                                                      .text;
                                            });
                                            if (_model.passwordMismatch !=
                                                true) {
                                              logFirebaseEvent('Button_auth');
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              if (_model
                                                      .passwordSignupController
                                                      .text !=
                                                  _model
                                                      .passwordconfirmController
                                                      .text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Passwords don\'t match!',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }

                                              final user = await authManager
                                                  .createAccountWithEmail(
                                                context,
                                                _model
                                                    .emailSignupController.text,
                                                _model.passwordSignupController
                                                    .text,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              await ProfilesTable().update(
                                                data: {
                                                  'expert': true,
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'id',
                                                  currentUserUid,
                                                ),
                                              );
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamedAuth(
                                                  'createProfile1',
                                                  context.mounted);
                                            }
                                          },
                                    text: 'Create Account',
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
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
                                ],
                              ),
                            ].divide(SizedBox(height: 20.0)),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
