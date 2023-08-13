### If you are looking for a complete Deep Translator client, refer to [anonfiles_client_uno](https://pub.dev/packages/anonfiles_client_uno) instead.

---

# Deep Translator API interface for Dart

[![Pub Version](https://img.shields.io/pub/v/anonfiles_client)](https://pub.dev/packages/anonfiles_client)

This is a library that defines signatures (interface) to interacting with [Deep Translator API](https://deep-translator-api.azurewebsites.net/docs). This also defines all required data models. It is written in pure Dart using code-generation.

**You are very unlikely to be searching for this library though, this was created to remove the HTTP library dependency from the API interface, it acts like a "platform interface" package.**

Notice: This is a unofficial project, maintained by volunteers.

## Installation

```yaml
dependencies:
  anonfiles_client: ^<latest-version>
```

Import:

```dart
import 'package:anonfiles_client/anonfiles_client.dart';
```

## Custom client

```dart
class MyCustomDeepTranslatorClient implements DeepTranslatorClient {
  // TODO: Implement/override methods.
}
```

`DeepTranslatorClient` is the abstract class that defines all signatures, so you can always extend or implement it.

Now you can do your own implementation and re-use the data models.

This can also be used to mock the `DeepTranslatorClient` class.

## Contributing

Dependencies other than code generation aren't allowed in this package, contributions are allowed only to change, add or remove signatures that corresponds to the [Deep Translator API](https://deep-translator-api.azurewebsites.net/docs), if you wanna implement something, create a new package that depends on this package instead. We also offer a [package that implements this interface using Dio as HTTP client](https://github.com/alexrintt/deept.dart/tree/master/packages/anonfiles_client_uno).

### Code generation

This package uses code generation to handle data models:

```bash
# Get deps.
dart pub get

# Generate code, switch 'watch' for 'build' if you don't wanna watch for file changes.
dart run build_runner watch --delete-conflicting-outputs
```

It's done, add any model or signature and send PR.
