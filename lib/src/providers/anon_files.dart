import 'package:uno/uno.dart';

import '../common/uno_client_base.dart';

class AnonFiles extends AnonFilesUnoClientBase {
  AnonFiles({Uno? uno, String apiUploadUrl = kApiUploadUrl})
      : super(
          uno: uno,
          apiUploadUrl: apiUploadUrl,
        );

  static const String kApiUploadUrl = 'https://api.anonfiles.com/upload';
}
