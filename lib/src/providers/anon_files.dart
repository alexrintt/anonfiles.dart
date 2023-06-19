import '../common/anon_files_impl_base.dart';

/// Implementation of [AnonFilesImplClientBase] for https://anonfiles.com/.
///
/// Usage:
/// ```dart
/// final AnonFiles anonFiles = AnonFiles();
/// await for (final AnonFileUploadEvent event
///     in anonFiles.upload(bytes: bytes, filename: filename)) {
///   print('Event: $event');
/// }
/// ```
class AnonFiles extends AnonFilesImplClientBase {
  AnonFiles({String apiUploadUrl = kApiUploadUrl})
      : super(
          id: 'anonfiles.com',
          apiUploadUrl: apiUploadUrl,
        );

  static const String kApiUploadUrl = 'https://api.anonfiles.com/upload';
}
