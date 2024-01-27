import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

Future<void> share(String link) async {
  await FlutterShare.share(
      title: 'Download App',
      text: 'Please download Grameen Digital Health App from the following link',
      linkUrl: link,
      chooserTitle: 'Download App'
  );
}