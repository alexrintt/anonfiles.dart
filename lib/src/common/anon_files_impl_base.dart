import 'dart:async';
import 'dart:typed_data';

import '../models/anon_file_upload.dart';
import 'anon_files_client_base.dart';
import 'get_direct_download_url_with.dart';
import 'upload_file_with.dart';

/// Provides a common implementation across all AnonFiles APIs.
///
/// To create a new wrapper for a new AnonFiles site, use:
///
/// ```dart
/// class CustomAnonFilesClient extends AnonFilesImplClientBase {
///   CustomAnonFilesClient({String? id, String apiUploadUrl = kApiUploadUrl})
///       : super(
///           id: id,
///           apiUploadUrl: apiUploadUrl,
///         );
///
///   static const String kApiUploadUrl = 'https://api.any-custom-anonfile-sapi.com/upload';
/// }
/// ```
abstract class AnonFilesImplClientBase extends AnonFilesClientBase {
  AnonFilesImplClientBase({
    required String id,
    required this.apiUploadUrl,
  }) : super(id: id);

  /// {@template api.client.apiUploadUrl}
  /// The target upload URL endpoint, you can override it through the constructor or by extending this class.
  /// {@endtemplate}
  final String apiUploadUrl;

  /// {@macro api.uploadFileBytesWithProgress}
  @override
  Stream<AnonFileUploadEvent> uploadFileBytesWithProgress({
    required Stream<Uint8List> byteStream,
    required String filename,
    required int length,
    MultipartRequestClient? multipartRequestClient,
    AnonFileUploadResponse? Function(Map<String, dynamic>)? mapResponseJson,
  }) =>
      uploadFileWith(
        byteStream: byteStream,
        filename: filename,
        endpoint: apiUploadUrl,
        length: length,
        multipartRequestClient: multipartRequestClient,
        mapResponseJson: mapResponseJson,
      );

  /// {@macro api.getDirectDownloadUrl}
  @override
  Future<String?> getDirectDownloadUrl(String downloadUrl) =>
      getDirectDownloadUrlWith(downloadUrl: downloadUrl);
}
