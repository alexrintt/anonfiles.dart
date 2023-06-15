import 'dart:io';
import 'dart:typed_data';

import 'package:anonfiles/anonfiles.dart';

void main() async {
  final Uint8List bytes = File('example/sample.txt').readAsBytesSync();
  const String filename = 'sample.txt';

  // https://anonfiles.com/docs/api
  print('[AnonFiles]:');
  final AnonFiles anonFiles = AnonFiles();
  await for (final AnonFileUploadEvent event
      in anonFiles.upload(bytes: bytes, filename: filename)) {
    print('Event: $event');
  }

  // https://filechan.org/docs/api
  print('[fileChan]:');
  final FileChan fileChan = FileChan();
  await for (final AnonFileUploadEvent event
      in fileChan.upload(bytes: bytes, filename: filename)) {
    print('Event: $event');
  }

  // https://letsupload.cc/docs/api
  print('[letsUpload]:');
  final LetsUpload letsUpload = LetsUpload();
  await for (final AnonFileUploadEvent event
      in letsUpload.upload(bytes: bytes, filename: filename)) {
    print('Event: $event');
  }
}
