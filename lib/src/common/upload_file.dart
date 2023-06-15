import 'dart:async';
import 'dart:typed_data';

import 'package:uno/uno.dart';

import '../models/anon_file_upload.dart';

Stream<AnonFileUploadEvent> uploadFileWith({
  required Uno uno,
  required String endpoint,
  required Uint8List bytes,
  required String filename,
}) {
  final FormData formData = FormData();

  final StreamController<AnonFileUploadEvent> controller =
      StreamController<AnonFileUploadEvent>.broadcast();

  (() async {
    try {
      formData.addBytes('file', bytes, filename: filename);

      // Streams are futures, but futures are not streams.
      // So if tracking the upload progress become supported in the future, I don't need to change the API signature.
      controller.sink.add(
        const AnonFileUploadEvent(
          progress: 0,
          response: null,
        ),
      );

      final Response response = await uno.post(
        endpoint,
        data: formData,
      );

      controller.sink.add(
        AnonFileUploadEvent(
          progress: 1,
          response: AnonFileUploadResponse.fromJson(
            response.data as Map<String, dynamic>,
          ),
        ),
      );
    } finally {
      await controller.close();
    }
  })();

  return controller.stream;
}
