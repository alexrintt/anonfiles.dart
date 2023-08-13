import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_url.freezed.dart';
part 'file_url.g.dart';

@freezed
class FileUrl with _$FileUrl {
  const factory FileUrl({
    String? full,
    String? short,
  }) = _FileUrl;

  factory FileUrl.fromJson(Map<String, dynamic> json) =>
      _$FileUrlFromJson(json);
}
