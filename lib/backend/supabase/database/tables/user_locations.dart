import '../database.dart';

class UserLocationsTable extends SupabaseTable<UserLocationsRow> {
  @override
  String get tableName => 'user_locations';

  @override
  UserLocationsRow createRow(Map<String, dynamic> data) =>
      UserLocationsRow(data);
}

class UserLocationsRow extends SupabaseDataRow {
  UserLocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserLocationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  double get lat => getField<double>('lat')!;
  set lat(double value) => setField<double>('lat', value);

  double get lng => getField<double>('lng')!;
  set lng(double value) => setField<double>('lng', value);

  String get latlangText => getField<String>('latlang_text')!;
  set latlangText(String value) => setField<String>('latlang_text', value);

  String? get googleCompoundCode => getField<String>('google_compound_code');
  set googleCompoundCode(String? value) =>
      setField<String>('google_compound_code', value);

  int? get country => getField<int>('country');
  set country(int? value) => setField<int>('country', value);

  String? get closestPlace => getField<String>('closest_place');
  set closestPlace(String? value) => setField<String>('closest_place', value);

  int? get distanceMts => getField<int>('distance_mts');
  set distanceMts(int? value) => setField<int>('distance_mts', value);
}
