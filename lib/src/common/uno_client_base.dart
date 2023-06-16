import 'dart:async';
import 'dart:typed_data';

import 'package:uno/uno.dart';
import '../models/anon_file_upload.dart';
import 'anon_files_client_base.dart';
import 'get_direct_download_url_with.dart';
import 'upload_file_with.dart';

/// Provides a common implementation across all AnonFiles APIs.
///
/// To create a new wrapper for a new AnonFiles site, use:
///
/// ```dart
/// class CustomAnonFilesClient extends AnonFilesUnoClientBase {
///   CustomAnonFilesClient({Uno? uno, String apiUploadUrl = kApiUploadUrl})
///       : super(
///           uno: uno,
///           apiUploadUrl: apiUploadUrl,
///         );
///
///   static const String kApiUploadUrl = 'https://api.any-custom-anonfile-sapi.com/upload';
/// }
/// ```
abstract class AnonFilesUnoClientBase implements AnonFilesClientBase {
  AnonFilesUnoClientBase({
    required this.id,
    required this.apiUploadUrl,
    this.uno,
  });

  /// {@macro api.id}
  final String id;

  /// [Uno] associated HTTP client with this object.
  final Uno? uno;

  /// {@template api.client.apiUploadUrl}
  /// The target upload URL endpoint, you can override it through the constructor or by extending this class.
  /// {@endtemplate}
  final String apiUploadUrl;

  Uno? __uno;
  Uno get _uno => uno ?? (__uno ??= Uno());

  /// {@macro api.upload}
  @override
  Stream<AnonFileUploadEvent> upload({
    required Uint8List bytes,
    required String filename,
  }) =>
      uploadFileWith(
        bytes: bytes,
        filename: filename,
        endpoint: apiUploadUrl,
        uno: _uno,
      );

  /// {@macro api.getDirectDownloadUrl}
  @override
  Future<String?> getDirectDownloadUrl(String downloadUrl) =>
      getDirectDownloadUrlWith(downloadUrl: downloadUrl);
}
