import 'dart:async';
import 'dart:typed_data';

import 'package:uno/uno.dart';
import '../models/anon_file_upload.dart';
import 'anon_files_service_base.dart';
import 'upload_file.dart';

abstract class AnonFilesUnoClientBase implements AnonFilesClientBase {
  AnonFilesUnoClientBase({required this.apiUploadUrl, this.uno});

  final Uno? uno;
  final String apiUploadUrl;

  Uno? __uno;
  Uno get _uno => uno ?? (__uno ??= Uno());

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
}
