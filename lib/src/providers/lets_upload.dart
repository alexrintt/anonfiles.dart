import 'package:uno/uno.dart';

import '../common/uno_client_base.dart';

/// Implementation of [AnonFilesUnoClientBase] for https://letsupload.cc/.
///
/// Usage:
/// ```dart
/// final LetsUpload letsUpload = LetsUpload();
/// await for (final AnonFileUploadEvent event
///     in letsUpload.upload(bytes: bytes, filename: filename)) {
///   print('Event: $event');
/// }
/// ```
class LetsUpload extends AnonFilesUnoClientBase {
  LetsUpload({Uno? uno, String apiUploadUrl = kApiUploadUrl})
      : super(
          id: 'letsupload.cc',
          uno: uno,
          apiUploadUrl: apiUploadUrl,
        );

  static const String kApiUploadUrl = 'https://api.letsupload.cc/upload';
}
