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
    AnonFileUploadResponseError? error,
  }) = _AnonFileUploadResponse;

  const AnonFileUploadResponse._();

  factory AnonFileUploadResponse.fromJson(Map<String, Object?> json) =>
      _$AnonFileUploadResponseFromJson(json);

  /// Alias getter to [data?.file?.url?.short].
  String? get htmlDownloadShortUrl => data?.file?.htmlUrl?.short;

  /// Alias getter to [data?.file?.url?.full].
  String? get htmlDownloadFullUrl => data?.file?.htmlUrl?.full;

  /// [htmlDownloadShortUrl] or [htmlDownloadFullUrl].
  String? get htmlDownloadUrl => htmlDownloadShortUrl ?? htmlDownloadFullUrl;
}

/// The response class for the AnonFile upload response error.
@freezed
class AnonFileUploadResponseError with _$AnonFileUploadResponseError {
  const factory AnonFileUploadResponseError({
    String? message,
    String? type,
    int? code,
  }) = _AnonFileUploadResponseError;

  factory AnonFileUploadResponseError.fromJson(Map<String, Object?> json) =>
      _$AnonFileUploadResponseErrorFromJson(json);
}

/// The data class for the AnonFile upload response.
@freezed
class AnonFileUploadResponseData with _$AnonFileUploadResponseData {
  const factory AnonFileUploadResponseData({
    AnonFile? file,
  }) = _AnonFileUploadResponseData;

  const AnonFileUploadResponseData._();

  factory AnonFileUploadResponseData.fromJson(Map<String, Object?> json) =>
      _$AnonFileUploadResponseDataFromJson(json);

  /// Alias getter to [file?.url?.short].
  String? get htmlDownloadShortUrl => file?.htmlUrl?.short;

  /// Alias getter to [file?.url?.full].
  String? get htmlDownloadFullUrl => file?.htmlUrl?.full;

  /// [htmlDownloadShortUrl] or [htmlDownloadFullUrl].
  String? get htmlDownloadUrl => htmlDownloadShortUrl ?? htmlDownloadFullUrl;
}

/// The file returned by the upload response.
///
/// Use [url] to get the download URL and [metadata] to get more info about it.
@freezed
class AnonFile with _$AnonFile {
  const factory AnonFile({
    @JsonKey(name: 'url') AnonFileHtmlUrl? htmlUrl,
    AnonFileMetadata? metadata,
  }) = _AnonFile;

  factory AnonFile.fromJson(Map<String, Object?> json) =>
      _$AnonFileFromJson(json);
}

/// Holder for the [full] and [short] download links.
@freezed
class AnonFileHtmlUrl with _$AnonFileHtmlUrl {
  const factory AnonFileHtmlUrl({
    String? full,
    String? short,
  }) = _AnonFileHtmlUrl;

  factory AnonFileHtmlUrl.fromJson(Map<String, Object?> json) =>
      _$AnonFileHtmlUrlFromJson(json);
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
