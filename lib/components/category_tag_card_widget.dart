import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_tag_card_model.dart';
export 'category_tag_card_model.dart';

class CategoryTagCardWidget extends StatefulWidget {
  const CategoryTagCardWidget({
    Key? key,
    this.categoryId,
  }) : super(key: key);

  final String? categoryId;

  @override
  _CategoryTagCardWidgetState createState() => _CategoryTagCardWidgetState();
}

class _CategoryTagCardWidgetState extends State<CategoryTagCardWidget>
    with TickerProviderStateMixin {
  late CategoryTagCardModel _model;

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
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
          begin: Offset(-20.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryTagCardModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<CategoriesRow>>(
      future: CategoriesTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id',
          widget.categoryId,
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
        List<CategoriesRow> containerCategoryCategoriesRowList = snapshot.data!;
        final containerCategoryCategoriesRow =
            containerCategoryCategoriesRowList.isNotEmpty
                ? containerCategoryCategoriesRowList.first
                : null;
        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).accent1,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(6.0, 3.0, 6.0, 3.0),
            child: AutoSizeText(
              containerCategoryCategoriesRow!.name!,
              maxLines: 1,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Montserrat',
                    lineHeight: 1.0,
                  ),
            ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
          ),
        );
      },
    );
  }
}
