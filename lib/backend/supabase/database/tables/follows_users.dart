import '../database.dart';

class FollowsUsersTable extends SupabaseTable<FollowsUsersRow> {
  @override
  String get tableName => 'follows_users';

  @override
  FollowsUsersRow createRow(Map<String, dynamic> data) => FollowsUsersRow(data);
}

class FollowsUsersRow extends SupabaseDataRow {
  FollowsUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FollowsUsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  String? get follower => getField<String>('follower');
  set follower(String? value) => setField<String>('follower', value);
}
