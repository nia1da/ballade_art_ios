import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';
import 'dpi_helper.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // ✅ Daha deterministic
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  /// Testlerde pending Timer kalmasın diye splash gecikmelerini kapatmak için.
  final bool disableSplashDelays;

  const MyApp({super.key, this.disableSplashDelays = false});

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
    try {
      final minimumDisplayTime = widget.disableSplashDelays
          ? Future<void>.value()
          : Future.delayed(const Duration(seconds: 3));

      final preloadTasks = Future.wait([
        _preloadDpi(),
        _preloadFonts(),
      ]);

      await Future.wait([minimumDisplayTime, preloadTasks]);
    } catch (e) {
      debugPrint('Initialize error: $e');
    } finally {
      // ✅ Splash asla takılı kalmasın
      FlutterNativeSplash.remove();
    }
  }

  Future<void> _preloadDpi() async {
    try {
      await DpiHelper.getDpi();
    } catch (e) {
      debugPrint('Error preloading DPI: $e');
    }
  }

  Future<void> _preloadFonts() async {
    if (widget.disableSplashDelays) return;
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
