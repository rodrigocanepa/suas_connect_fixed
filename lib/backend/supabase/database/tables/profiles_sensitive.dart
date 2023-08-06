import '../database.dart';

class ProfilesSensitiveTable extends SupabaseTable<ProfilesSensitiveRow> {
  @override
  String get tableName => 'profiles_sensitive';

  @override
  ProfilesSensitiveRow createRow(Map<String, dynamic> data) =>
      ProfilesSensitiveRow(data);
}

class ProfilesSensitiveRow extends SupabaseDataRow {
  ProfilesSensitiveRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesSensitiveTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get birthdate => getField<DateTime>('birthdate');
  set birthdate(DateTime? value) => setField<DateTime>('birthdate', value);
}
