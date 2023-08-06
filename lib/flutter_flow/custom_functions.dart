import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

bool hasUploadedMedia(String? mediaPath) {
  return mediaPath != null && mediaPath.isNotEmpty;
}

List<double>? extractLatLng(LatLng latLng) {
  // Extract lat & lng from 'LatLng(lat: 1.00101, lng: -12.12122)' as floats.
  final lat = latLng.latitude;
  final lng = latLng.longitude;
  return [lat, lng];
}

String convertSingleStringWithPipe(List<String> coordinatesDestinations) {
  // Merge input list of text values and create a single string separating values with pipe character
  return coordinatesDestinations.join('|');
}

int returnIndexClosestDistance(List<int> listOfDistancesMeters) {
  // Retrurn the index number of the smallest integer in a list
  int minIndex = 0;
  int minValue = listOfDistancesMeters[0];
  for (int i = 1; i < listOfDistancesMeters.length; i++) {
    if (listOfDistancesMeters[i] < minValue) {
      minValue = listOfDistancesMeters[i];
      minIndex = i;
    }
  }
  return minIndex;
}

LatLng convert2doublesToLatLngType(String doublesToConvert) {
  // Extract two doubles from text separated by comma and return a LatLng type
  final List<String> doublesList = doublesToConvert.split(',');
  final double lat = double.parse(doublesList[0]);
  final double lng = double.parse(doublesList[1]);
  return LatLng(lat, lng);
}

List<String>? extractIdFromBlockedUsers(
    List<UserBlocksRow>? blockedUSerResponse) {
  // Create an array of strings from user_id in user_blocks
  if (blockedUSerResponse == null || blockedUSerResponse.isEmpty) {
    return null;
  }
  final List<String> blockedUserIds = [];
  for (final block in blockedUSerResponse) {
    blockedUserIds.add(block.userId);
  }
  return blockedUserIds;
}
