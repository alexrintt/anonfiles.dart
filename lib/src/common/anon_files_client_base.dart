import 'dart:typed_data';

import '../models/anon_file_upload.dart';

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
    required Uint8List bytes,
    required String filename,
  });

  /// {@template api.uploadFileBytes}
  /// Upload a given file [bytes] with a given [filename] and return the response as a [Future].
  /// {@endtemplate}
  Future<AnonFileUploadResponse?> uploadFileBytes({
    required Uint8List bytes,
    required String filename,
  }) async {
    final AnonFileUploadEvent lastEvent =
        await uploadFileBytesWithProgress(bytes: bytes, filename: filename)
            .last;

    return lastEvent.response;
  }

  /// {@template api.getDirectDownloadUrl}
  /// Scrape the direct download link from the provided [downloadUrl] when [upload]ing it.
  ///
  /// AnonFiles APIs download URLs point to their websites with a download button, not the file.
  ///
  /// To workaround this, this method will download the HTML page and scrape the direct link from the download button and return it.
  ///
  /// Then you can directly download this URL without needing to redirect the user or opening a webview.
  /// {@endtemplate}
  Future<String?> getDirectDownloadUrl(String downloadUrl);
}
