import '../anonfiles_client.dart';

/// Interface for this client, if you are looking for a concrete implementation
/// use [DeepTranslatorClientDio.create] from [anonfiles_client_uno] package instead.
abstract class DeepTranslatorClient with CloseableMixin {
  const DeepTranslatorClient();

  /// {@macro google}
  GoogleService get google;
}
