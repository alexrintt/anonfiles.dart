import 'dart:io';

import 'package:anonfiles/src/common/get_direct_download_url_with.dart';
import 'package:test/test.dart';

// To debug with third-party software like HTTP Toolkit
class HttpNoCertValidation extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = HttpNoCertValidation();

  test('E2EE test [getDirectDownloadUrl]', () async {
    // Pre-uploaded file.
    const String kHtmlDownloadUrl =
        'https://anonfiles.com/z554Vcw7z4/sample_txt';

    final String? directDownloadUrl =
        await getDirectDownloadUrlWith(downloadUrl: kHtmlDownloadUrl);

    expect(directDownloadUrl, isNot(isNull));
  });
}
