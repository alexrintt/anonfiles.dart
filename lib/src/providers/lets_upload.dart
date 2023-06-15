import 'package:uno/uno.dart';

import '../common/uno_client_base.dart';

class LetsUpload extends AnonFilesUnoClientBase {
  LetsUpload({Uno? uno, String apiUploadUrl = kApiUploadUrl})
      : super(
          uno: uno,
          apiUploadUrl: apiUploadUrl,
        );

  static const String kApiUploadUrl = 'https://api.letsupload.cc/upload';
}
