import 'dart:io';

import 'package:anonfiles/anonfiles.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {
  HttpOverrides.global = HttpNoCertValidation();

  test('E2EE [upload] & [getDirectDownloadUrl]', () async {
    final List<AnonFilesClientBase> clients = allClients();

    for (final AnonFilesClientBase client in clients) {
      final AnonFileUploadResponse? response = await client.uploadFileBytes(
        byteStream: sampleFileByteStream,
        length: sampleFileLength,
        filename: kSampleFileName,
      );

      final AnonFileHtmlUrl? htmlUrl = response?.data?.file?.htmlUrl;
      final String? fileId = response?.data?.file?.metadata?.id;

      expect(htmlUrl, isNot(isNull));
      expect(htmlUrl!.full, isNot(isNull));
      expect(htmlUrl.short, isNot(isNull));

      expect(
        await getDirectDownloadUrlWith(downloadUrl: htmlUrl.full!),
        contains(fileId),
      );
      expect(
        await getDirectDownloadUrlWith(downloadUrl: htmlUrl.short!),
        contains(fileId),
      );
    }
  });
}
