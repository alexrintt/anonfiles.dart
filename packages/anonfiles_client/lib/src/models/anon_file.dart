import 'package:freezed_annotation/freezed_annotation.dart';

import 'file_metadata.dart';
import 'file_url.dart';

part 'anon_file.freezed.dart';
part 'anon_file.g.dart';

@freezed
class AnonFile with _$AnonFile {
  const factory AnonFile({
    FileUrl? url,
    FileMetadata? metadata,
  }) = _AnonFile;

  factory AnonFile.fromJson(Map<String, dynamic> json) =>
      _$AnonFileFromJson(json);
}
