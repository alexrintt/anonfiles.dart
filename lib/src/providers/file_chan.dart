import '../common/anon_files_impl_base.dart';

/// Implementation of [AnonFilesClientBase] for https://filechan.org/.
///
/// Usage:
/// ```dart
/// final FileChan fileChan = FileChan();
/// await for (final AnonFileUploadEvent event
///     in fileChan.upload(bytes: bytes, filename: filename)) {
///   print('Event: $event');
/// }
/// ```
class FileChan extends AnonFilesImplClientBase {
  FileChan({String apiUploadUrl = kApiUploadUrl})
      : super(
          id: 'filechan.org',
          apiUploadUrl: apiUploadUrl,
        );

  static const String kApiUploadUrl = 'https://api.filechan.org/upload';
}
