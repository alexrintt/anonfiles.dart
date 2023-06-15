import 'package:uno/uno.dart';

import '../common/uno_client_base.dart';

class FileChan extends AnonFilesUnoClientBase {
  FileChan({Uno? uno, String apiUploadUrl = kApiUploadUrl})
      : super(
          uno: uno,
          apiUploadUrl: apiUploadUrl,
        );

  static const String kApiUploadUrl = 'https://api.filechan.org/upload';
}
