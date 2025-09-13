import 'package:flutter/material.dart';
import 'package:getcalleyapp/provider/list_provider.dart';
import 'package:getcalleyapp/provider/video_provider.dart';
import 'package:getcalleyapp/screens/language_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListProvider()),
        ChangeNotifierProvider(create: (_) => VideoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LanguagePage(), debugShowCheckedModeBanner: false);
  }
}
