import 'dart:io';
import 'dart:typed_data';

import 'package:anonfiles/anonfiles.dart';

Future<void> useClient(AnonFilesClientBase client) async {
  print('[${client.runtimeType}]');

  final File file = File('data/sample.txt');

  final Stream<Uint8List> byteStream =
      File('data/sample.txt').openRead().map(Uint8List.fromList);

  final int length = file.lengthSync();

  const String filename = 'sample.txt';

  final AnonFileUploadResponse? response = await client.uploadFileBytes(
    byteStream: byteStream,
    filename: filename,
    length: length,
  );

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
