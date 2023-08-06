// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<double>> newCustomAction(LatLng? latlangString) async {
  // Extract lat & lng from 'LatLng(lat: 1.00101, lng: -12.12122)' as floats
  if (latlangString == null) {
    return [];
  }
  String latLng = latlangString.toString();
  RegExp regExp = RegExp(r"[-+]?\d*\.\d+|\d+");
  Iterable<Match> matches = regExp.allMatches(latLng);
  List<double> latLngList = [];
  for (Match match in matches) {
    latLngList.add(double.parse(match.group(0)!));
  }
  return latLngList;
}
