import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_question_copy_model.dart';
export 'create_question_copy_model.dart';

class CreateQuestionCopyWidget extends StatefulWidget {
  const CreateQuestionCopyWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  final QueryUserPlacesRow? question;

  @override
  _CreateQuestionCopyWidgetState createState() =>
      _CreateQuestionCopyWidgetState();
}

class _CreateQuestionCopyWidgetState extends State<CreateQuestionCopyWidget> {
  late CreateQuestionCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateQuestionCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createQuestionCopy'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: FFButtonWidget(
          onPressed: () async {
            logFirebaseEvent('CREATE_QUESTION_COPY_CANCEL_BTN_ON_TAP');
            logFirebaseEvent('Button_navigate_back');
            context.safePop();
          },
          text: 'Cancel',
          options: FFButtonOptions(
            width: 80.0,
            height: 40.0,
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).secondaryBackground,
            textStyle: FlutterFlowTheme.of(context).labelMedium,
            elevation: 0.0,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('CREATE_QUESTION_COPY_SAVE_CHANGES_BTN_ON');
                logFirebaseEvent('Button_validate_form');
                if (_model.formKey.currentState == null ||
                    !_model.formKey.currentState!.validate()) {
                  return;
                }
                logFirebaseEvent('Button_backend_call');
                await QueriesTable().update(
                  data: {
                    'updated_at': supaSerialize<DateTime>(getCurrentTimestamp),
                    'title': _model.titleController.text,
                    'content': _model.bodyController.text,
                  },
                  matchingRows: (rows) => rows.eq(
                    'id',
                    widget.question?.query,
                  ),
                );
                logFirebaseEvent('Button_navigate_back');
                context.safePop();
              },
              text: 'Save Changes',
              options: FFButtonOptions(
                width: 160.0,
                height: 32.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
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
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final rowProfilesRow = rowProfilesRowList.isNotEmpty
                      ? rowProfilesRowList.first
                      : null;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rowProfilesRow!.name!,
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            Text(
                              '@${rowProfilesRow?.username}',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 8.0),
                  child: FutureBuilder<List<QueriesRow>>(
                    future: QueriesTable().querySingleRow(
                      queryFn: (q) => q.eq(
                        'id',
                        widget.question?.query,
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
                      List<QueriesRow> columnQueriesRowList = snapshot.data!;
                      final columnQueriesRow = columnQueriesRowList.isNotEmpty
                          ? columnQueriesRowList.first
                          : null;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<List<PlacesRow>>(
                            future: PlacesTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id',
                                widget.question?.place,
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
                              List<PlacesRow> rowplacePlacesRowList =
                                  snapshot.data!;
                              final rowplacePlacesRow =
                                  rowplacePlacesRowList.isNotEmpty
                                      ? rowplacePlacesRowList.first
                                      : null;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          rowplacePlacesRow!.image!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.placeController ??=
                                          TextEditingController(
                                        text: rowplacePlacesRow?.placeName,
                                      ),
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Place',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent4,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      minLines: 1,
                                      validator: _model.placeControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 6.0)),
                              );
                            },
                          ),
                          TextFormField(
                            controller: _model.titleController ??=
                                TextEditingController(
                              text: columnQueriesRow?.title,
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelLarge,
                              hintText: 'Title of your Question',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent4,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
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
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            minLines: 1,
                            validator: _model.titleControllerValidator
                                .asValidator(context),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: FutureBuilder<List<CategoriesRow>>(
                              future: CategoriesTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'id',
                                  widget.question?.category,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CategoriesRow> catCategoriesRowList =
                                    snapshot.data!;
                                final catCategoriesRow =
                                    catCategoriesRowList.isNotEmpty
                                        ? catCategoriesRowList.first
                                        : null;
                                return TextFormField(
                                  controller: _model.catController ??=
                                      TextEditingController(
                                    text: catCategoriesRow?.name,
                                  ),
                                  readOnly: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Category',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent4,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  minLines: 1,
                                  validator: _model.catControllerValidator
                                      .asValidator(context),
                                );
                              },
                            ),
                          ),
                          TextFormField(
                            controller: _model.bodyController ??=
                                TextEditingController(
                              text: columnQueriesRow?.content,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Body',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelLarge,
                              hintText: 'body text (optional)',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).accent4,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
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
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLines: 30,
                            minLines: 4,
                            validator: _model.bodyControllerValidator
                                .asValidator(context),
                          ),
                        ]
                            .divide(SizedBox(height: 12.0))
                            .around(SizedBox(height: 12.0)),
                      );
                    },
                  ),
                ),
              ),
            ),
            if (false)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    random_data.randomImageUrl(
                      0,
                      0,
                    ),
                    width: double.infinity,
                    height: 170.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (false)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.notes,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.add_photo_alternate_outlined,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 20.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('CREATE_QUESTION_COPY_DELETE_QUESTION_BTN');
                  logFirebaseEvent('Button_backend_call');
                  await QueriesTable().delete(
                    matchingRows: (rows) => rows.eq(
                      'id',
                      widget.question?.query,
                    ),
                  );
                  logFirebaseEvent('Button_navigate_back');
                  context.safePop();
                },
                text: 'Delete Question',
                icon: Icon(
                  Icons.delete_outlined,
                  color: FlutterFlowTheme.of(context).error,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).error,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Color(0xFFD32F2F),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
