import 'dart:convert';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:json_theme/json_theme.dart';
import 'package:prodiag/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prodiag/views/screens/auth/welcome_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle
      .loadString('assets/themes/appainter_theme_green-dark.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    info("main - start apply");

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
      ],
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const WelcomePage(),
    );
  }
}
