import 'dart:io';

import 'package:anonfiles/anonfiles.dart';
import 'package:test/test.dart';

import 'common.dart';
import 'get_direct_download_url_test.dart';

void main() {
  HttpOverrides.global = HttpNoCertValidation();

  test(
      '[E2EE] test if [upload] emits the response as the last element of the stream',
      () async {
    final List<AnonFilesClientBase> clients = allClients();

    for (final AnonFilesClientBase client in clients) {
      final AnonFileUploadResponse? response = await client.uploadFileBytes(
        byteStream: sampleFileByteStream,
        length: sampleFileLength,
        filename: kSampleFileName,
      );

      expect(response, isNot(isNull));
    }
  });
}
