import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/ThemeModel.dart';
import 'Provider/ThemeProvider.dart';
import 'Views/ShlokPage.dart';
import 'Views/detailPage.dart';
import 'Views/introScreen.dart';
import 'homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDark = prefs.getBool('appTheme') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder: (context, _) => Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: const ColorScheme.light(),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: const ColorScheme.dark(
                brightness: Brightness.dark,
              ),
            ),
            themeMode: themeProvider.isdark ? ThemeMode.dark : ThemeMode.light,
            routes: {
              '/': (context) => const SplashScreen(),
              'hp': (context) => const HomePage(),
              'DetailPage': (context) => const DetailPage(),
              'ShlokPage': (context) => const ShlokPage(),
            },
          );
        },
      ),
    ),
  );
}
