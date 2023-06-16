import 'package:anonfiles/anonfiles.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {
  test('E2EE [upload] & [getDirectDownloadUrl]', () async {
    final List<AnonFilesClientBase> clients = allClients();

    for (final AnonFilesClientBase client in clients) {
      final AnonFileUploadEvent result = await client
          .upload(bytes: sampleFileBytes, filename: kSampleFileName)
          .last;

      final AnonFileUrl? url = result.response?.data?.file?.url;
      final String? fileId = result.response?.data?.file?.metadata?.id;

      expect(url, isNot(isNull));
      expect(url!.full, isNot(isNull));
      expect(url.short, isNot(isNull));

      expect(
        await getDirectDownloadUrlWith(downloadUrl: url.full!),
        contains(fileId),
      );
      expect(
        await getDirectDownloadUrlWith(downloadUrl: url.short!),
        contains(fileId),
      );
    }
  });
}
