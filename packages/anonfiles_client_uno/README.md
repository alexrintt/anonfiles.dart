# Deep Translator for Dart

[![Pub Version](https://img.shields.io/pub/v/anonfiles_client_uno)](https://pub.dev/packages/anonfiles_client_uno) [![Pub Version](https://img.shields.io/pub/points/anonfiles_client_uno)](https://pub.dev/packages/anonfiles_client_uno)

This is a library for interacting with [Deep Translator API](https://deep-translator-api.azurewebsites.net/docs). It works on all platforms and exposes a collection of data classes and a extendable client interface.

Notice: This is a unofficial project, maintained by volunteers.

## Installation

```yaml
dependencies:
  anonfiles_client_uno: ^<latest-version>
```

Import:

```dart
import 'package:anonfiles_client_uno/anonfiles_client_uno.dart';
```

## Usage

The usage is pretty straightforward:

```dart
final deept = DeepTranslatorClientDio.create();
final response = await deept.google.translate('Welcome to the club!');

print(response.translation); // Bem vindo ao clube!
print(response.error); // null
```

Services that are currently available (complete or partially complete):

- [x] Google translate.
- [ ] DeepL.
- [ ] Microsoft translator.
- [ ] MyMemory.
- [ ] Linguee.
- [ ] Yandex.
- [ ] Pons.
- [ ] Papago.
- [ ] Libre translate.
- [ ] QCRI.

All services are accessible by `deept.<service-name>.<endpoint-name>(...)`.

### Custom Dio instance

By default, this package uses fresh [Dio](https://pub.dev/packages/dio) instance for handling HTTP requests, if you want to provide a custom instance, use `dio` argument:

```dart
final myDioInstance = Dio();
final deept = DeepTranslatorClientDio.create(dio: myDioInstance);
```

## Contributing

TODO.
