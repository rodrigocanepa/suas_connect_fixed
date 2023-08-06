import '../database.dart';

class SuasTeamTable extends SupabaseTable<SuasTeamRow> {
  @override
  String get tableName => 'suas_team';

  @override
  SuasTeamRow createRow(Map<String, dynamic> data) => SuasTeamRow(data);
}

class SuasTeamRow extends SupabaseDataRow {
  SuasTeamRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SuasTeamTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get nickname => getField<String>('nickname');
  set nickname(String? value) => setField<String>('nickname', value);

  String? get suasProfile => getField<String>('suas_profile');
  set suasProfile(String? value) => setField<String>('suas_profile', value);

  String? get instagram => getField<String>('instagram');
  set instagram(String? value) => setField<String>('instagram', value);

  String? get linkedin => getField<String>('linkedin');
  set linkedin(String? value) => setField<String>('linkedin', value);

  String? get whatsapp => getField<String>('whatsapp');
  set whatsapp(String? value) => setField<String>('whatsapp', value);

  String? get about => getField<String>('about');
  set about(String? value) => setField<String>('about', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);
}
