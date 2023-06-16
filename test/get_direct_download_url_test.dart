import 'package:anonfiles/src/common/get_direct_download_url_with.dart';
import 'package:test/test.dart';

void main() {
  test('E2EE [getDirectDownloadUrlTest]', () async {
    // Pre-uploaded file.
    const String kHtmlDownloadUrl =
        'https://anonfiles.com/z554Vcw7z4/sample_txt';

    final String? directDownloadUrl =
        await getDirectDownloadUrlWith(downloadUrl: kHtmlDownloadUrl);

    expect(directDownloadUrl, isNot(isNull));
  });
}
