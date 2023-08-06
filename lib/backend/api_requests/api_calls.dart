import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Supabase Public Group Code

class SupabasePublicGroup {
  static String baseUrl = 'https://xppspwqennohzbutsnrc.supabase.co/rest/v1';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhwcHNwd3Flbm5vaHpidXRzbnJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk0NDIyMTcsImV4cCI6MjAwNTAxODIxN30.nOEfBFVUNXy4Q8OKiGKAgjerRgnxY2z21Vua_mU-ySg',
  };
  static GetUsernameCall getUsernameCall = GetUsernameCall();
  static ThisUserHasUsernameCall thisUserHasUsernameCall =
      ThisUserHasUsernameCall();
  static MentorSignupCheckCall mentorSignupCheckCall = MentorSignupCheckCall();
  static GetCountryByshortIsoCodeCall getCountryByshortIsoCodeCall =
      GetCountryByshortIsoCodeCall();
  static GetAllPlacesCall getAllPlacesCall = GetAllPlacesCall();
  static GetCategoriesCall getCategoriesCall = GetCategoriesCall();
}

class GetUsernameCall {
  Future<ApiCallResponse> call({
    String? username = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get username',
      apiUrl: '${SupabasePublicGroup.baseUrl}/profiles?username=eq.${username}',
      callType: ApiCallType.GET,
      headers: {
        ...SupabasePublicGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic username(dynamic response) => getJsonField(
        response,
        r'''$[:].username''',
      );
}

class ThisUserHasUsernameCall {
  Future<ApiCallResponse> call({
    String? loggedInUserId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'This user has username',
      apiUrl: '${SupabasePublicGroup.baseUrl}/profiles?id=eq.${loggedInUserId}',
      callType: ApiCallType.GET,
      headers: {
        ...SupabasePublicGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic resultedUsername(dynamic response) => getJsonField(
        response,
        r'''$[:].username''',
      );
}

class MentorSignupCheckCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Mentor Signup check',
      apiUrl: '${SupabasePublicGroup.baseUrl}/settings?select=*',
      callType: ApiCallType.GET,
      headers: {
        ...SupabasePublicGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic active(dynamic response) => getJsonField(
        response,
        r'''$[:].mentorLink''',
      );
  dynamic code(dynamic response) => getJsonField(
        response,
        r'''$[:].mentorCode''',
      );
}

class GetCountryByshortIsoCodeCall {
  Future<ApiCallResponse> call({
    String? iso2code = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get country byshort  iso code',
      apiUrl:
          '${SupabasePublicGroup.baseUrl}/countries?iso2=eq.${iso2code}&select=id',
      callType: ApiCallType.GET,
      headers: {
        ...SupabasePublicGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic countryID(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
}

class GetAllPlacesCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get all places',
      apiUrl: '${SupabasePublicGroup.baseUrl}/places?select=*',
      callType: ApiCallType.GET,
      headers: {
        ...SupabasePublicGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic placeID(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic placeName(dynamic response) => getJsonField(
        response,
        r'''$[:].place_name''',
        true,
      );
  dynamic placeLat(dynamic response) => getJsonField(
        response,
        r'''$[:].gps_latitude''',
        true,
      );
  dynamic placeLng(dynamic response) => getJsonField(
        response,
        r'''$[:].gps_longitude''',
        true,
      );
  dynamic placeDesc(dynamic response) => getJsonField(
        response,
        r'''$[:].description''',
        true,
      );
  dynamic placeFollowers(dynamic response) => getJsonField(
        response,
        r'''$[:].followers''',
        true,
      );
  dynamic placeCoordinates(dynamic response) => getJsonField(
        response,
        r'''$[:].gps_coordinates''',
        true,
      );
}

class GetCategoriesCall {
  Future<ApiCallResponse> call({
    String? name = 'Architecture',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get categories',
      apiUrl:
          '${SupabasePublicGroup.baseUrl}/categories?select=*&name=eq.${name}',
      callType: ApiCallType.GET,
      headers: {
        ...SupabasePublicGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic idCategory(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
}

/// End Supabase Public Group Code

class GetInitalProfilePicCall {
  static Future<ApiCallResponse> call({
    String? nameOfEmail = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Inital Profile Pic',
      apiUrl:
          'https://ui-avatars.com/api/?background=random&name=${nameOfEmail}&rounded=true',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GoogleMapsReverseGeocodingPrivateCall {
  static Future<ApiCallResponse> call({
    String? latlng = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Google Maps Reverse Geocoding Private',
      apiUrl: 'https://maps.googleapis.com/maps/api/geocode/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latlng': latlng,
        'key': "AIzaSyDm3Y4GEmn28lJiQe8FtyQW2ETeJ2JIJnY",
        'result_type': "sublocality",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic formatedAddress(dynamic response) => getJsonField(
        response,
        r'''$.results[:].formatted_address''',
      );
  static dynamic shortNames(dynamic response) => getJsonField(
        response,
        r'''$.results[:].address_components[:].short_name''',
        true,
      );
  static dynamic compoundCode(dynamic response) => getJsonField(
        response,
        r'''$.plus_code.compound_code''',
      );
  static dynamic statusText(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic resultArray(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      );
}

class ProfileSearchCall {
  static Future<ApiCallResponse> call({
    String? searchString = 'oma',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Profile Search',
      apiUrl:
          'https://xppspwqennohzbutsnrc.supabase.co/rest/v1/profiles?select=*&username=ilike.%${searchString}%&limit=10',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhwcHNwd3Flbm5vaHpidXRzbnJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk0NDIyMTcsImV4cCI6MjAwNTAxODIxN30.nOEfBFVUNXy4Q8OKiGKAgjerRgnxY2z21Vua_mU-ySg',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhwcHNwd3Flbm5vaHpidXRzbnJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk0NDIyMTcsImV4cCI6MjAwNTAxODIxN30.nOEfBFVUNXy4Q8OKiGKAgjerRgnxY2z21Vua_mU-ySg',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  static dynamic username(dynamic response) => getJsonField(
        response,
        r'''$[:].username''',
        true,
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
  static dynamic instructors(dynamic response) => getJsonField(
        response,
        r'''$[:].Instructors''',
        true,
      );
  static dynamic learners(dynamic response) => getJsonField(
        response,
        r'''$[:].Learners''',
        true,
      );
  static dynamic avatarurl(dynamic response) => getJsonField(
        response,
        r'''$[:].avatar_url''',
        true,
      );
}

class MostPopularProfilesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Most popular profiles',
      apiUrl:
          'https://xppspwqennohzbutsnrc.supabase.co/rest/v1/profiles?select=*&order=Learners.desc&limit=10',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhwcHNwd3Flbm5vaHpidXRzbnJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk0NDIyMTcsImV4cCI6MjAwNTAxODIxN30.nOEfBFVUNXy4Q8OKiGKAgjerRgnxY2z21Vua_mU-ySg',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhwcHNwd3Flbm5vaHpidXRzbnJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk0NDIyMTcsImV4cCI6MjAwNTAxODIxN30.nOEfBFVUNXy4Q8OKiGKAgjerRgnxY2z21Vua_mU-ySg',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic returnedIds(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
}

class GoogleDistanceMatrixCall {
  static Future<ApiCallResponse> call({
    String? destinationsSeparatedByPipe = '',
    String? origin = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Google Distance Matrix',
      apiUrl:
          'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${destinationsSeparatedByPipe}&origins=${origin}&key=AIzaSyDm3Y4GEmn28lJiQe8FtyQW2ETeJ2JIJnY',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic distanceMeters(dynamic response) => getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.value''',
        true,
      );
}

class DeleteUserCall {
  static Future<ApiCallResponse> call({
    String? user = '',
    String? image = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'delete user',
      apiUrl: 'https://hooks.zapier.com/hooks/catch/16118497/31lcpzu/',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'user': user,
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
