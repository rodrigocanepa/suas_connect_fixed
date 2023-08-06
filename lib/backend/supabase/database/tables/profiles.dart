import '../database.dart';

class ProfilesTable extends SupabaseTable<ProfilesRow> {
  @override
  String get tableName => 'profiles';

  @override
  ProfilesRow createRow(Map<String, dynamic> data) => ProfilesRow(data);
}

class ProfilesRow extends SupabaseDataRow {
  ProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  int? get nationality => getField<int>('nationality');
  set nationality(int? value) => setField<int>('nationality', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  int get learners => getField<int>('learners')!;
  set learners(int value) => setField<int>('learners', value);

  int get instructors => getField<int>('instructors')!;
  set instructors(int value) => setField<int>('instructors', value);

  int get quests => getField<int>('quests')!;
  set quests(int value) => setField<int>('quests', value);

  DateTime? get lastLogin => getField<DateTime>('last_login');
  set lastLogin(DateTime? value) => setField<DateTime>('last_login', value);

  bool get expert => getField<bool>('expert')!;
  set expert(bool value) => setField<bool>('expert', value);

  int get interactionScore => getField<int>('interaction_score')!;
  set interactionScore(int value) => setField<int>('interaction_score', value);
}
