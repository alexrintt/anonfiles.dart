import '../../anonfiles.dart';

List<AnonFilesClientBase> allClients() {
  return <AnonFilesClientBase>[
    AnonFiles(),
    FileChan(),
    LetsUpload(),
  ];
}
