import 'package:url_launcher/url_launcher.dart';

class UrILauncher {
  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchCall(String phone) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    launchUrl(phoneLaunchUri);
  }

  void launchEmail(String? email) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    launchUrl(emailLaunchUri);
  }
}
