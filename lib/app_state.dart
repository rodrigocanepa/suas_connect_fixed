import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _completedSetup = prefs.getBool('ff_completedSetup') ?? _completedSetup;
    });
    _safeInit(() {
      _isMentor = prefs.getBool('ff_isMentor') ?? _isMentor;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_latestLocation')) {
        try {
          _latestLocation =
              jsonDecode(prefs.getString('ff_latestLocation') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _blockedUsers = prefs.getStringList('ff_blockedUsers') ?? _blockedUsers;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _completedSetup = false;
  bool get completedSetup => _completedSetup;
  set completedSetup(bool _value) {
    _completedSetup = _value;
    prefs.setBool('ff_completedSetup', _value);
  }

  bool _isMentor = false;
  bool get isMentor => _isMentor;
  set isMentor(bool _value) {
    _isMentor = _value;
    prefs.setBool('ff_isMentor', _value);
  }

  DateTime? _latestLocationUpdate =
      DateTime.fromMillisecondsSinceEpoch(1690322400000);
  DateTime? get latestLocationUpdate => _latestLocationUpdate;
  set latestLocationUpdate(DateTime? _value) {
    _latestLocationUpdate = _value;
  }

  dynamic _latestLocation;
  dynamic get latestLocation => _latestLocation;
  set latestLocation(dynamic _value) {
    _latestLocation = _value;
    prefs.setString('ff_latestLocation', jsonEncode(_value));
  }

  List<String> _blockedUsers = [];
  List<String> get blockedUsers => _blockedUsers;
  set blockedUsers(List<String> _value) {
    _blockedUsers = _value;
    prefs.setStringList('ff_blockedUsers', _value);
  }

  void addToBlockedUsers(String _value) {
    _blockedUsers.add(_value);
    prefs.setStringList('ff_blockedUsers', _blockedUsers);
  }

  void removeFromBlockedUsers(String _value) {
    _blockedUsers.remove(_value);
    prefs.setStringList('ff_blockedUsers', _blockedUsers);
  }

  void removeAtIndexFromBlockedUsers(int _index) {
    _blockedUsers.removeAt(_index);
    prefs.setStringList('ff_blockedUsers', _blockedUsers);
  }

  void updateBlockedUsersAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _blockedUsers[_index] = updateFn(_blockedUsers[_index]);
    prefs.setStringList('ff_blockedUsers', _blockedUsers);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
