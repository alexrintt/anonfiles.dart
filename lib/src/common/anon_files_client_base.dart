import 'dart:typed_data';

import '../../anonfiles.dart';

/// Base client for all AnonFiles clients.
abstract class AnonFilesClientBase {
  const AnonFilesClientBase({required this.id});

  /// {@template api.id}
  /// Identifies the current client, generally used to differ between the several API domains.
  /// {@endtemplate}
  final String id;

  /// {@template api.uploadFileBytesWithProgress}
  /// Upload a given file [bytes] with a given [filename] and return the response as a [Stream].
  /// {@endtemplate}
  Stream<AnonFileUploadEvent> uploadFileBytesWithProgress({
    required Stream<Uint8List> byteStream,
    required String filename,
    required int length,
    MultipartRequestClient? multipartRequestClient,
    AnonFileUploadResponse? Function(Map<String, dynamic>)? mapResponseJson,
  });

  /// {@template api.uploadFileBytes}
  /// Upload a given file [bytes] with a given [filename] and return the response as a [Future].
  /// {@endtemplate}
  Future<AnonFileUploadResponse?> uploadFileBytes({
    required Stream<Uint8List> byteStream,
    required String filename,
    required int length,
    MultipartRequestClient? multipartRequestClient,
    AnonFileUploadResponse? Function(Map<String, dynamic>)? mapResponseJson,
  }) async {
    final AnonFileUploadEvent lastEvent = await uploadFileBytesWithProgress(
      byteStream: byteStream,
      filename: filename,
      length: length,
      multipartRequestClient: multipartRequestClient,
      mapResponseJson: mapResponseJson ?? defaultUploadResponseJsonMapper,
    ).firstWhere((AnonFileUploadEvent event) => event.response != null);

    return lastEvent.response;
  }

  AnonFileUploadResponse defaultUploadResponseJsonMapper(
    Map<String, dynamic> json,
  ) =>
      AnonFileUploadResponse.fromJson(json);
}
