import '../database.dart';

class QueriesTable extends SupabaseTable<QueriesRow> {
  @override
  String get tableName => 'queries';

  @override
  QueriesRow createRow(Map<String, dynamic> data) => QueriesRow(data);
}

class QueriesRow extends SupabaseDataRow {
  QueriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QueriesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get score => getField<int>('score');
  set score(int? value) => setField<int>('score', value);

  int? get type => getField<int>('type');
  set type(int? value) => setField<int>('type', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);
}
