import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wajve_coding_challenge/provider.dart';
import 'package:wajve_coding_challenge/view/app.dart';

void main() {
  final app = MultiProvider(
    providers: providers,
    child: App(),
  );
  runApp(app);
}
