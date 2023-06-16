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

await client.uploadFileBytes(bytes: bytes, filename: filename);
await client.getDirectDownloadUrl(htmlDownloadUrl);
```

Check [/example](https://github.com/alexrintt/anonfiles.dart/blob/main/example/anonfiles_example.dart) for details.

## Issues and requests

- For security and vulnerability reports, see https://alexrintt.io/.well-known/security.txt.
- For support, questions, bugs and feature requests open a [new issue](https://github.com/alexrintt/anonfiles.dart/issues/new).

## Contributing

1. First off, fork the repository.

2. Setup dev environment:

```shell
# Clone repo.
$ git clone <your-fork-url>
$ cd anonfiles.dart

# Get deps.
$ dart pub get

# Dart code gen for data models.
$ dart run derry run gen:dart:watch
```

3. Commit and push:

```shell
git add .
git commit -m "Describe changes"
git push origin contrib/changes
```

4. Open PR.