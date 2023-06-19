import '../common/anon_files_impl_base.dart';

/// Implementation of [AnonFilesClientBase] for https://letsupload.cc/.
///
/// Usage:
/// ```dart
/// final LetsUpload letsUpload = LetsUpload();
/// await for (final AnonFileUploadEvent event
///     in letsUpload.upload(bytes: bytes, filename: filename)) {
///   print('Event: $event');
/// }
/// ```
class LetsUpload extends AnonFilesImplClientBase {
  LetsUpload({String apiUploadUrl = kApiUploadUrl})
      : super(
          id: 'letsupload.cc',
          apiUploadUrl: apiUploadUrl,
        );

  static const String kApiUploadUrl = 'https://api.letsupload.cc/upload';
}
