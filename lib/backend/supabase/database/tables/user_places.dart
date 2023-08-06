import '../database.dart';

class UserPlacesTable extends SupabaseTable<UserPlacesRow> {
  @override
  String get tableName => 'user_places';

  @override
  UserPlacesRow createRow(Map<String, dynamic> data) => UserPlacesRow(data);
}

class UserPlacesRow extends SupabaseDataRow {
  UserPlacesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserPlacesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  String? get place => getField<String>('place');
  set place(String? value) => setField<String>('place', value);

  int? get role => getField<int>('role');
  set role(int? value) => setField<int>('role', value);
}
