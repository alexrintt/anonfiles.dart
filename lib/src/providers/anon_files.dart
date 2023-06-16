import 'package:uno/uno.dart';

import '../common/uno_client_base.dart';

/// Implementation of [AnonFilesUnoClientBase] for https://anonfiles.com/.
///
/// Usage:
/// ```dart
/// final AnonFiles anonFiles = AnonFiles();
/// await for (final AnonFileUploadEvent event
///     in anonFiles.upload(bytes: bytes, filename: filename)) {
///   print('Event: $event');
/// }
/// ```
class AnonFiles extends AnonFilesUnoClientBase {
  AnonFiles({Uno? uno, String apiUploadUrl = kApiUploadUrl})
      : super(
          id: 'anonfiles.com',
          uno: uno,
          apiUploadUrl: apiUploadUrl,
        );

  static const String kApiUploadUrl = 'https://api.anonfiles.com/upload';
}
