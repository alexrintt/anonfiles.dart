import 'dart:typed_data';

import '../models/anon_file_upload.dart';

abstract class AnonFilesClientBase {
  const AnonFilesClientBase();

  Stream<AnonFileUploadEvent> upload({
    required Uint8List bytes,
    required String filename,
  });
}
