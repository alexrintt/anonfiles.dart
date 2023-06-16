import 'package:freezed_annotation/freezed_annotation.dart';

part 'anon_file_upload.freezed.dart';
part 'anon_file_upload.g.dart';

/// The event emitted by AnonFiles clients [upload] method.
///
/// Allow tracking the upload [progress] and, when done, get the request [response].
@freezed
class AnonFileUploadEvent with _$AnonFileUploadEvent {
  const factory AnonFileUploadEvent({
    double? progress,
    AnonFileUploadResponse? response,
  }) = _AnonFileUploadEvent;

  factory AnonFileUploadEvent.fromJson(Map<String, Object?> json) =>
      _$AnonFileUploadEventFromJson(json);
}

/// The response class for the AnonFile upload response.
@freezed
class AnonFileUploadResponse with _$AnonFileUploadResponse {
  const factory AnonFileUploadResponse({
    bool? status,
    AnonFileUploadResponseData? data,
  }) = _AnonFileUploadResponse;

  factory AnonFileUploadResponse.fromJson(Map<String, Object?> json) =>
      _$AnonFileUploadResponseFromJson(json);
}

/// The data class for the AnonFile upload response.
@freezed
class AnonFileUploadResponseData with _$AnonFileUploadResponseData {
  const factory AnonFileUploadResponseData({
    AnonFile? file,
  }) = _AnonFileUploadResponseData;

  factory AnonFileUploadResponseData.fromJson(Map<String, Object?> json) =>
      _$AnonFileUploadResponseDataFromJson(json);
}

/// The file returned by the upload response.
///
/// Use [url] to get the download URL and [metadata] to get more info about it.
@freezed
class AnonFile with _$AnonFile {
  const factory AnonFile({
    AnonFileUrl? url,
    AnonFileMetadata? metadata,
  }) = _AnonFile;

  factory AnonFile.fromJson(Map<String, Object?> json) =>
      _$AnonFileFromJson(json);
}

/// Holder for the [full] and [short] download links.
@freezed
class AnonFileUrl with _$AnonFileUrl {
  const factory AnonFileUrl({
    String? full,
    String? short,
  }) = _AnonFileUrl;

  factory AnonFileUrl.fromJson(Map<String, Object?> json) =>
      _$AnonFileUrlFromJson(json);
}

/// Metadata returned by the upload response.
@freezed
class AnonFileMetadata with _$AnonFileMetadata {
  const factory AnonFileMetadata({
    String? id,
    String? name,
    AnonFileSize? size,
  }) = _AnonFileMetadata;

  factory AnonFileMetadata.fromJson(Map<String, Object?> json) =>
      _$AnonFileMetadataFromJson(json);
}

/// Holder for file [bytes] count and the human [readable] size.
@freezed
class AnonFileSize with _$AnonFileSize {
  const factory AnonFileSize({
    int? bytes,
    String? readable,
  }) = _AnonFileSize;

  factory AnonFileSize.fromJson(Map<String, Object?> json) =>
      _$AnonFileSizeFromJson(json);
}
