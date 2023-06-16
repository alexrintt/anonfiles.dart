import 'dart:io';
import 'dart:typed_data';

import 'package:anonfiles/anonfiles.dart';

Future<void> useClient(AnonFilesClientBase client) async {
  print('[${client.runtimeType}]');

  final Uint8List bytes = File('data/sample.txt').readAsBytesSync();
  const String filename = 'sample.txt';

  final AnonFileUploadEvent result =
      await client.upload(bytes: bytes, filename: filename).last;

  if (result.response?.error != null) {
    // Handle error.
    print('Error: ${result.response?.error?.message}');
  } else {}

  final String htmlDownloadUrl = result.response!.data!.file!.url!.short!;

  // URL to open the download page.
  print('HTML download short URL: $htmlDownloadUrl');

  final String? fileDirectDownloadUrl =
      await client.getDirectDownloadUrl(htmlDownloadUrl);

  // URL to the file directly.
  print('Direct download URL: $fileDirectDownloadUrl');

  print('[-End-]\n');
}

void main() async {
  for (final AnonFilesClientBase client in allClients()) {
    await useClient(client);
  }
}
