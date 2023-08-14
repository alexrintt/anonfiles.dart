import '../../anonfiles.dart';
import '../providers/anonym_file.dart';

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
