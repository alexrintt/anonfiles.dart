import '../../anonfiles.dart';

List<AnonFilesClientBase> allClients() {
  return <AnonFilesClientBase>[
    // All of these are down...
    // AnonFiles(),
    // FileChan(),
    // LetsUpload(),

    // New ones, working:
    AnonymFile(),
  ];
}
