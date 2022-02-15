import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

Future<void> sendMail({required String email, required String prefilledBody}) async {
  final url = 'mailto:$email';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    log('Cannot launch mail sending');
  }
}
