import '../database.dart';

class UserCategoriesTable extends SupabaseTable<UserCategoriesRow> {
  @override
  String get tableName => 'user_categories';

  @override
  UserCategoriesRow createRow(Map<String, dynamic> data) =>
      UserCategoriesRow(data);
}

class UserCategoriesRow extends SupabaseDataRow {
  UserCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserCategoriesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get editedAt => getField<DateTime>('edited_at');
  set editedAt(DateTime? value) => setField<DateTime>('edited_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get category => getField<String>('category')!;
  set category(String value) => setField<String>('category', value);
}
