import 'dart:io';
import 'dart:typed_data';

import 'package:anonfiles/anonfiles.dart';

Future<void> useClient(AnonFilesClientBase client) async {
  print('[${client.runtimeType}]');

  final Uint8List bytes = File('data/sample.txt').readAsBytesSync();
  const String filename = 'sample.txt';

  final AnonFileUploadResponse? response =
      await client.uploadFileBytes(bytes: bytes, filename: filename);

  if (response?.data != null) {
    final String htmlDownloadUrl = response!.htmlDownloadUrl!;

    final String? fileDirectDownloadUrl =
        await client.getDirectDownloadUrl(htmlDownloadUrl);

    // URL to open the download page.
    print('HTML download short URL: $htmlDownloadUrl');

    // URL to the file directly.
    print('Direct download URL: $fileDirectDownloadUrl');

    print('[-End-]\n');
  } else {
    // Handle error.
    print('Error: ${response?.error?.message}');
  }
}

void main() async {
  for (final AnonFilesClientBase client in allClients()) {
    await useClient(client);
  }
}
