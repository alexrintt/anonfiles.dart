import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../models/anon_file_upload.dart';
import 'multipart_request_with_camel_case_headers.dart';

typedef MultipartRequestClient = Stream<Uint8List> Function(
  String url,
  Stream<Uint8List> source,
  int length, {
  String method,
  String filename,
});

Stream<Uint8List> _httpSendMultipartRequestTo(
  String url,
  Stream<Uint8List> byteStream,
  int length, {
  String method = 'POST',
  String filename = 'file',
}) async* {
  final http.MultipartFile multipartFile =
      http.MultipartFile('file', byteStream, length, filename: filename);

  final MultipartRequestWithCamelCaseHeaders request =
      MultipartRequestWithCamelCaseHeaders(method, Uri.parse(url))
        ..files.add(multipartFile);

  final http.StreamedResponse response = await request.send();

  yield* response.stream.map(Uint8List.fromList);
}

Stream<Uint8List> sendMultipartRequestTo(
  String url,
  Stream<Uint8List> byteStream,
  int length, {
  String method = 'POST',
  String filename = 'file',
}) async* {
  yield* _httpSendMultipartRequestTo(
    url,
    byteStream,
    length,
    filename: filename,
    method: method,
  );
}

/// {@template uploadFileWith}
/// Help function that actually uploads the file [bytes]
/// with a given [filename] using a [multipartRequestClient] provider to a given AnonFiles [endpoint].
/// {@endtemplate}
Stream<AnonFileUploadEvent> uploadFileWith({
  required String endpoint,
  required Stream<Uint8List> byteStream,
  required String filename,
  required int length,
  MultipartRequestClient? multipartRequestClient,
}) {
  final MultipartRequestClient sendMultipartRequest =
      multipartRequestClient ?? sendMultipartRequestTo;

  late final StreamController<AnonFileUploadEvent> controller;

  Stream<AnonFileUploadEvent> upload() async* {
    yield const AnonFileUploadEvent(
      progress: 0,
      response: null,
    );

    final Uint8List raw = await sendMultipartRequest(
      endpoint,
      byteStream,
      length,
      filename: filename,
    ).reduce(
      (Uint8List previous, Uint8List element) => Uint8List.fromList(
        <int>[...previous, ...element],
      ),
    );

    final Map<String, dynamic> response =
        jsonDecode(utf8.decode(raw)) as Map<String, dynamic>;

    yield AnonFileUploadEvent(
      progress: 1,
      response: AnonFileUploadResponse.fromJson(response),
    );
  }

  Future<void> onCancel() async {
    await controller.close();
  }

  Future<void> onListen() async {
    await controller.addStream(upload());
    await onCancel();
  }

  void onPause() {
    throw UnsupportedError(
      'Resume and cancel are not supported when uploading a file.',
    );
  }

  void onResume() {
    throw UnsupportedError(
      'Resume and cancel are not supported when uploading a file.',
    );
  }

  controller = StreamController<AnonFileUploadEvent>(
    onCancel: onCancel,
    onListen: onListen,
    onPause: onPause,
    onResume: onResume,
  );

  return controller.stream;
}
