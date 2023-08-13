import 'package:freezed_annotation/freezed_annotation.dart';

import 'file_size.dart';

part 'file_metadata.freezed.dart';
part 'file_metadata.g.dart';

@freezed
class FileMetadata with _$FileMetadata {
  const factory FileMetadata({
    String? id,
    String? name,
    FileSize? size,
  }) = _FileMetadata;

  factory FileMetadata.fromJson(Map<String, dynamic> json) =>
      _$FileMetadataFromJson(json);
}
