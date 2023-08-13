import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_size.freezed.dart';
part 'file_size.g.dart';

abstract class IFileSize {
  const IFileSize({this.bytes, this.readable});

  final int? bytes;
  final String? readable;
}

@freezed
class FileSize with _$FileSize implements IFileSize {
  const factory FileSize({
    int? bytes,
    String? readable,
  }) = _FileSize;

  factory FileSize.fromJson(Map<String, dynamic> json) =>
      _$FileSizeFromJson(json);
}

class FileSizeModel implements IFileSize {
  @override
  // TODO: implement bytes
  int? get bytes => throw UnimplementedError();

  @override
  // TODO: implement readable
  String? get readable => throw UnimplementedError();
}
