import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfile1Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> selectedCategoriesIDs = [];
  void addToSelectedCategoriesIDs(String item) =>
      selectedCategoriesIDs.add(item);
  void removeFromSelectedCategoriesIDs(String item) =>
      selectedCategoriesIDs.remove(item);
  void removeAtIndexFromSelectedCategoriesIDs(int index) =>
      selectedCategoriesIDs.removeAt(index);
  void updateSelectedCategoriesIDsAtIndex(
          int index, Function(String) updateFn) =>
      selectedCategoriesIDs[index] = updateFn(selectedCategoriesIDs[index]);

  int loopCounterSelectedCategories = 0;

  ///  State fields for stateful widgets in this page.

  InstantTimer? addCategoriesUSerLoop;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    addCategoriesUSerLoop?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
