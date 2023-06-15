# AnonFiles for Dart

[![Pub Version](https://img.shields.io/pub/v/anonfiles)](https://pub.dev/packages/anonfiles) [![Pub Version](https://img.shields.io/pub/points/anonfiles)](https://pub.dev/packages/anonfiles)

This is a library for interacting with [AnonFiles API](https://anonfiles.com/) related APIs:

- https://anonfiles.com/.
- https://filechan.org/.
- https://letsupload.cc/.

## Installation

```yaml
dependencies:
  anonfiles: ^<latest-version>
```

Import:

```dart
import 'package:anonfiles/anonfiles.dart';
```

## Usage

The usage is pretty straightforward:

```dart
final Uint8List bytes = File('example/sample.txt').readAsBytesSync();
const String filename = 'sample.txt';

// https://anonfiles.com/docs/api
print('[AnonFiles]:');
final AnonFiles anonFiles = AnonFiles();
await for (final AnonFileUploadEvent event
    in anonFiles.upload(bytes: bytes, filename: filename)) {
  print('Event: $event');
}

// https://filechan.org/docs/api
print('[fileChan]:');
final FileChan fileChan = FileChan();
await for (final AnonFileUploadEvent event
    in fileChan.upload(bytes: bytes, filename: filename)) {
  print('Event: $event');
}

// https://letsupload.cc/docs/api
print('[letsUpload]:');
final LetsUpload letsUpload = LetsUpload();
await for (final AnonFileUploadEvent event
    in letsUpload.upload(bytes: bytes, filename: filename)) {
  print('Event: $event');
}
```

## Contributing

TODO.
