import '../database.dart';

class UserFlagQueryplaceTable extends SupabaseTable<UserFlagQueryplaceRow> {
  @override
  String get tableName => 'user_flag_queryplace';

  @override
  UserFlagQueryplaceRow createRow(Map<String, dynamic> data) =>
      UserFlagQueryplaceRow(data);
}

class UserFlagQueryplaceRow extends SupabaseDataRow {
  UserFlagQueryplaceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFlagQueryplaceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get queryplaceId => getField<String>('queryplace_id')!;
  set queryplaceId(String value) => setField<String>('queryplace_id', value);

  String get flagText => getField<String>('flag_text')!;
  set flagText(String value) => setField<String>('flag_text', value);
}
