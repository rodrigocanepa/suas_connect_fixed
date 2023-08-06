import '../database.dart';

class UserBlocksTable extends SupabaseTable<UserBlocksRow> {
  @override
  String get tableName => 'user_blocks';

  @override
  UserBlocksRow createRow(Map<String, dynamic> data) => UserBlocksRow(data);
}

class UserBlocksRow extends SupabaseDataRow {
  UserBlocksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserBlocksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get profileBlocked => getField<String>('profile_blocked')!;
  set profileBlocked(String value) =>
      setField<String>('profile_blocked', value);

  String get userBlocked => getField<String>('user_blocked')!;
  set userBlocked(String value) => setField<String>('user_blocked', value);

  DateTime? get lastCheck => getField<DateTime>('last_check');
  set lastCheck(DateTime? value) => setField<DateTime>('last_check', value);
}
