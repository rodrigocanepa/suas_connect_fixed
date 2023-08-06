import '../database.dart';

class UserVotesTable extends SupabaseTable<UserVotesRow> {
  @override
  String get tableName => 'user_votes';

  @override
  UserVotesRow createRow(Map<String, dynamic> data) => UserVotesRow(data);
}

class UserVotesRow extends SupabaseDataRow {
  UserVotesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserVotesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get questionId => getField<String>('question_id');
  set questionId(String? value) => setField<String>('question_id', value);

  int get type => getField<int>('type')!;
  set type(int value) => setField<int>('type', value);

  int? get commentId => getField<int>('comment_id');
  set commentId(int? value) => setField<int>('comment_id', value);
}
