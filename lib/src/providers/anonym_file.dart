import '../common/anon_files_impl_base.dart';
import '../models/anon_file_upload.dart';

/// Implementation of [AnonFilesClientBase] for https://AnonymFile.org/.
///
/// Usage:
/// ```dart
/// final AnonymFile AnonymFile = AnonymFile();
/// await for (final AnonFileUploadEvent event
///     in AnonymFile.upload(bytes: bytes, filename: filename)) {
///   print('Event: $event');
/// }
/// ```
class AnonymFile extends AnonFilesImplClientBase {
  AnonymFile({String apiUploadUrl = kApiUploadUrl})
      : super(
          id: 'anonymfile.com',
          apiUploadUrl: apiUploadUrl,
        );

  @override
  AnonFileUploadResponse defaultUploadResponseJsonMapper(
    Map<String, dynamic> json,
  ) {
    return super.defaultUploadResponseJsonMapper(<String, dynamic>{
      ...json,
      'data': <String, dynamic>{
        ...?json['data'] as Map<String, dynamic>?,
        'file': <String, dynamic>{
          ...?json['data']['file'] as Map<String, dynamic>?,
          'metadata': <String, dynamic>{
            ...?json['data']['file']['metadata'] as Map<String, dynamic>?,
            'size': <String, dynamic>{
              ...?json['data']['file']['metadata']['size']
                  as Map<String, dynamic>?,
              'bytes': (() {
                final dynamic bytes =
                    json['data']['file']['metadata']['size']['bytes'];

                if (bytes is String) {
                  return int.parse(bytes);
                }

                if (bytes is int) {
                  return bytes;
                }

                if (bytes is double) {
                  return bytes.toInt();
                }
              })(),
            },
          },
        },
      }
    });
  }

  static const String kApiUploadUrl = 'https://anonymfile.com/api/v1/upload';
}
