import 'package:url_launcher/url_launcher.dart';

const String adminEmail = "admin@gmail.com";

const defaultImageConstant = "Select Image";

const baseUrl = "http://159.89.98.34:5545";


class TimeOutConstants {
  static int connectTimeout = 30;
  static int receiveTimeout = 25;
  static int sendTimeout = 25;
}

const String token = "";
Future<void> urlLaunch(String websiteUrl) async {
  final Uri launchUri = Uri(
    scheme: 'https',
    path: websiteUrl,
  );
  await launchUrl(launchUri);
}
Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}