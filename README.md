# AnonFiles for Dart

[![Pub Version](https://img.shields.io/pub/v/anonfiles)](https://pub.dev/packages/anonfiles) [![Pub Version](https://img.shields.io/pub/points/anonfiles)](https://pub.dev/packages/anonfiles)

This is a library for interacting with [AnonFiles](https://anonfiles.com/) related APIs:

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
final client = AnonFiles(); // LetsUpload() and FileChan() are also available.

await client.upload(bytes: bytes, filename: filename);
await client.getDirectDownloadUrl(htmlDownloadUrl);
```

Check [/example](https://github.com/alexrintt/anonfiles.dart/blob/main/example/anonfiles_example.dart) for details.

## Contributing

TODO.
