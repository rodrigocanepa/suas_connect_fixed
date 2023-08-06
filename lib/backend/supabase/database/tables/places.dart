import '../database.dart';

class PlacesTable extends SupabaseTable<PlacesRow> {
  @override
  String get tableName => 'places';

  @override
  PlacesRow createRow(Map<String, dynamic> data) => PlacesRow(data);
}

class PlacesRow extends SupabaseDataRow {
  PlacesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlacesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get placeName => getField<String>('place_name');
  set placeName(String? value) => setField<String>('place_name', value);

  double? get gpsLatitude => getField<double>('gps_latitude');
  set gpsLatitude(double? value) => setField<double>('gps_latitude', value);

  double? get gpsLongitude => getField<double>('gps_longitude');
  set gpsLongitude(double? value) => setField<double>('gps_longitude', value);

  String? get threeWords => getField<String>('three_words');
  set threeWords(String? value) => setField<String>('three_words', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime get editedAt => getField<DateTime>('edited_at')!;
  set editedAt(DateTime value) => setField<DateTime>('edited_at', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  int? get followers => getField<int>('followers');
  set followers(int? value) => setField<int>('followers', value);

  String get gpsCoordinates => getField<String>('gps_coordinates')!;
  set gpsCoordinates(String value) =>
      setField<String>('gps_coordinates', value);
}
