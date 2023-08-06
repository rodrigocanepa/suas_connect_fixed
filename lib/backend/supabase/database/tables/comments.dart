import '../database.dart';

class CommentsTable extends SupabaseTable<CommentsRow> {
  @override
  String get tableName => 'comments';

  @override
  CommentsRow createRow(Map<String, dynamic> data) => CommentsRow(data);
}

class CommentsRow extends SupabaseDataRow {
  CommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get score => getField<int>('score');
  set score(int? value) => setField<int>('score', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get queryPlace => getField<String>('query_place')!;
  set queryPlace(String value) => setField<String>('query_place', value);

  int? get parentComment => getField<int>('parent_comment');
  set parentComment(int? value) => setField<int>('parent_comment', value);
}
