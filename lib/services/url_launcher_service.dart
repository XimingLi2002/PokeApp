import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

//API SERVICE Provider
final providerUrlLauncherManager = Provider<UrlLauncherService>((ref) => UrlLauncherService());

class UrlLauncherService {
  Future<void> launchUrlOnExternalApp(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch url');
    }
  }
}
