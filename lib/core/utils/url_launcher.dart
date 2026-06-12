import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  
UrlLauncher._();

static Future<void> urllauncher(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
  
}