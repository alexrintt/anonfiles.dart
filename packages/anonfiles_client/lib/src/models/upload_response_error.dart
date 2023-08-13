import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_response_error.freezed.dart';
part 'upload_response_error.g.dart';

@freezed
class UploadResponseError with _$UploadResponseError {
  const factory UploadResponseError({
    String? message,
    String? type,
    int? code,
  }) = _UploadResponseError;

  factory UploadResponseError.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseErrorFromJson(json);
}
