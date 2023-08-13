import 'package:dio/dio.dart';

import '../../anonfiles_client_uno.dart';

Dio createDeepTranslatorDioClientWith({
  String? accessToken,
  String baseUrl = kDefaultDeepTranslatorBaseUrl,
}) {
  final Map<String, String> headers = <String, String>{};

  if (accessToken != null) {
    headers['Authorization'] = 'Bearer $accessToken';
  }

  return Dio(
    BaseOptions(
      followRedirects: true,
      baseUrl: baseUrl,
      headers: headers,
    ),
  );
}
