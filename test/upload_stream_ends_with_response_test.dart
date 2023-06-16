import 'package:anonfiles/anonfiles.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {
  test(
      '[E2EE] test if [upload] emits the response as the last element of the stream',
      () async {
    final List<AnonFilesClientBase> clients = allClients();

    for (final AnonFilesClientBase client in clients) {
      final AnonFileUploadEvent response = await client
          .upload(bytes: sampleFileBytes, filename: kSampleFileName)
          .last;

      expect(response.response, isNot(isNull));
    }
  });
}
