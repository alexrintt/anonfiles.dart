import 'package:dio/dio.dart';

Options createNdjsonDioOptions() {
  return Options(
    headers: <String, String>{
      // If it is omitted, the response will be a pgn.
      'Accept': kApplicationNdjsonContentType,
    },
    responseType: ResponseType.stream,
    // This does not changes anything but better let it here in case of any changes from API side.
    contentType: kApplicationNdjsonContentType,
  );
}

Options createJsonDioOptions() {
  return Options(
    headers: <String, String>{
      // If it is omitted, the response will be a pgn.
      'Accept': kApplicationJsonContentType,
    },
    responseType: ResponseType.json,
    // This does not changes anything but better let it here in case of any changes from API side.
    contentType: kApplicationJsonContentType,
  );
}

const String kApplicationNdjsonContentType = 'application/x-ndjson';
const String kApplicationJsonContentType = 'application/json';
