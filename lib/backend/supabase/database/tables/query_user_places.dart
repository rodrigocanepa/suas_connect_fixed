import '../database.dart';

class QueryUserPlacesTable extends SupabaseTable<QueryUserPlacesRow> {
  @override
  String get tableName => 'query_user_places';

  @override
  QueryUserPlacesRow createRow(Map<String, dynamic> data) =>
      QueryUserPlacesRow(data);
}

class QueryUserPlacesRow extends SupabaseDataRow {
  QueryUserPlacesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QueryUserPlacesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get query => getField<String>('query');
  set query(String? value) => setField<String>('query', value);

  String? get place => getField<String>('place');
  set place(String? value) => setField<String>('place', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get editedAt => getField<DateTime>('edited_at');
  set editedAt(DateTime? value) => setField<DateTime>('edited_at', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  int? get score => getField<int>('score');
  set score(int? value) => setField<int>('score', value);

  int? get commentsCount => getField<int>('comments_count');
  set commentsCount(int? value) => setField<int>('comments_count', value);
}
