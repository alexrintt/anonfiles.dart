import 'package:web_scraper/web_scraper.dart';

Future<String?> getDirectDownloadUrlWith({
  required String downloadUrl,
  WebScraper? scrapper,
}) async {
  final WebScraper webScraper = scrapper ?? WebScraper();

  await webScraper.loadFullURL(downloadUrl);

  final List<String?> attrs =
      webScraper.getElementAttribute('#download-url', 'href');

  if (attrs.isNotEmpty) {
    return attrs.first;
  }

  return null;
}
