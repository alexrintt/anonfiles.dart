import 'package:uno/uno.dart';

import '../common/uno_client_base.dart';

/// Implementation of [AnonFilesUnoClientBase] for https://filechan.org/.
///
/// Usage:
/// ```dart
/// final FileChan fileChan = FileChan();
/// await for (final AnonFileUploadEvent event
///     in fileChan.upload(bytes: bytes, filename: filename)) {
///   print('Event: $event');
/// }
/// ```
class FileChan extends AnonFilesUnoClientBase {
  FileChan({Uno? uno, String apiUploadUrl = kApiUploadUrl})
      : super(
          uno: uno,
          apiUploadUrl: apiUploadUrl,
        );

  static const String kApiUploadUrl = 'https://api.filechan.org/upload';
}
