import 'package:freezed_annotation/freezed_annotation.dart';

import 'anon_file.dart';
import 'upload_response_error.dart';

part 'upload_response.freezed.dart';
part 'upload_response.g.dart';

@freezed
class UploadResponse with _$UploadResponse {
  const factory UploadResponse({
    bool? status,
    AnonFile? data,
    UploadResponseError? error,
  }) = _UploadResponse;

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);
}
