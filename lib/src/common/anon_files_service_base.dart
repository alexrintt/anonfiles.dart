import 'dart:typed_data';

import '../models/anon_file_upload.dart';

/// Base client for all AnonFiles clients.
abstract class AnonFilesClientBase {
  const AnonFilesClientBase();

  /// {@template api.upload}
  /// Upload a given file [bytes] with a given [filename].
  /// {@endtemplate}
  Stream<AnonFileUploadEvent> upload({
    required Uint8List bytes,
    required String filename,
  });
}
