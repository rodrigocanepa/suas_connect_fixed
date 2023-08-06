import '../database.dart';

class SettingsTable extends SupabaseTable<SettingsRow> {
  @override
  String get tableName => 'settings';

  @override
  SettingsRow createRow(Map<String, dynamic> data) => SettingsRow(data);
}

class SettingsRow extends SupabaseDataRow {
  SettingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SettingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get mentorCode => getField<String>('mentorCode');
  set mentorCode(String? value) => setField<String>('mentorCode', value);

  bool? get mentorLink => getField<bool>('mentorLink');
  set mentorLink(bool? value) => setField<bool>('mentorLink', value);

  bool get onlyPostIfNear => getField<bool>('only_post_if_near')!;
  set onlyPostIfNear(bool value) => setField<bool>('only_post_if_near', value);

  int? get minimumDistanceMeters => getField<int>('minimum_distance_meters');
  set minimumDistanceMeters(int? value) =>
      setField<int>('minimum_distance_meters', value);

  bool get signupsEnabled => getField<bool>('signups_enabled')!;
  set signupsEnabled(bool value) => setField<bool>('signups_enabled', value);

  bool get guestLogin => getField<bool>('guest_login')!;
  set guestLogin(bool value) => setField<bool>('guest_login', value);

  String? get toc => getField<String>('toc');
  set toc(String? value) => setField<String>('toc', value);

  String? get privacyTerms => getField<String>('privacy_terms');
  set privacyTerms(String? value) => setField<String>('privacy_terms', value);

  String? get aboutContent => getField<String>('about_content');
  set aboutContent(String? value) => setField<String>('about_content', value);

  bool? get showAbout => getField<bool>('show_about');
  set showAbout(bool? value) => setField<bool>('show_about', value);

  bool? get showTeam => getField<bool>('show_team');
  set showTeam(bool? value) => setField<bool>('show_team', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  String? get welcomeMessageStart => getField<String>('welcome_message_start');
  set welcomeMessageStart(String? value) =>
      setField<String>('welcome_message_start', value);

  String? get welcomeMessageEnd => getField<String>('welcome_message_end');
  set welcomeMessageEnd(String? value) =>
      setField<String>('welcome_message_end', value);

  String? get aboutImageHero => getField<String>('about_image_hero');
  set aboutImageHero(String? value) =>
      setField<String>('about_image_hero', value);
}
