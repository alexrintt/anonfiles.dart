import 'dart:io';
import 'dart:typed_data';

final Uint8List sampleFileBytes = File('data/sample.txt').readAsBytesSync();

final Stream<Uint8List> sampleFileByteStream =
    Stream<Uint8List>.fromIterable(<Uint8List>[sampleFileBytes]);

final int sampleFileLength = sampleFileBytes.length;

const String kSampleFileName = 'sample.txt';

// To debug with third-party software like HTTP Toolkit
class HttpNoCertValidation extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
