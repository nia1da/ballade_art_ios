import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';
import 'dpi_helper.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final minimumDisplayTime = Future.delayed(const Duration(seconds: 3));
    
    final preloadTasks = Future.wait([
      _preloadDpi(),
      _preloadFonts(),
    ]);

    await Future.wait([minimumDisplayTime, preloadTasks]);
    FlutterNativeSplash.remove();
  }

  Future<void> _preloadDpi() async {
    try {
      await DpiHelper.getDpi();
    } catch (e) {
      debugPrint('Error preloading DPI: $e');
    }
  }

  Future<void> _preloadFonts() async {
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BalladeArt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // ✅ Set Cinzel as the default font for the entire app
        textTheme: GoogleFonts.cinzelTextTheme(
          ThemeData.light().textTheme,
        ).apply(
          bodyColor: const Color(0xFFDFD0B8),
          displayColor: const Color(0xFFDFD0B8),
        ),
      ),
      home: const HomePage(),
    );
  }
}
