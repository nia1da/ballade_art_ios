import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dpi_helper.dart';
import 'responsive_helper.dart';
import 'package:video_player/video_player.dart';
import 'story_page.dart';

// 🔹 Yüzük ölçü tablosu (EU formatında; eski 'us' değerleri aynen 'eu' alanına taşındı)
final List<Map<String, dynamic>> sizeChart = [
  {"eu": 1, "diameter": 13.0, "circumference": 40.84},
  {"eu": 1.5, "diameter": 13.16, "circumference": 41.35},
  {"eu": 2, "diameter": 13.32, "circumference": 41.85},
  {"eu": 2.5, "diameter": 13.48, "circumference": 42.36},
  {"eu": 3, "diameter": 13.65, "circumference": 42.87},
  {"eu": 3.5, "diameter": 13.81, "circumference": 43.38},
  {"eu": 4, "diameter": 13.97, "circumference": 43.88},
  {"eu": 4.5, "diameter": 14.13, "circumference": 44.39},
  {"eu": 5, "diameter": 14.29, "circumference": 44.90},
  {"eu": 5.5, "diameter": 14.45, "circumference": 45.40},
  {"eu": 6, "diameter": 14.61, "circumference": 45.91},
  {"eu": 6.5, "diameter": 14.78, "circumference": 46.42},
  {"eu": 7, "diameter": 14.94, "circumference": 46.93},
  {"eu": 7.5, "diameter": 15.10, "circumference": 47.43},
  {"eu": 8, "diameter": 15.26, "circumference": 47.94},
  {"eu": 8.5, "diameter": 15.42, "circumference": 48.45},
  {"eu": 9, "diameter": 15.58, "circumference": 48.95},
  {"eu": 9.5, "diameter": 15.74, "circumference": 49.46},
  {"eu": 10, "diameter": 15.91, "circumference": 49.97},
  {"eu": 10.5, "diameter": 16.07, "circumference": 50.48},
  {"eu": 11, "diameter": 16.23, "circumference": 50.98},
  {"eu": 11.5, "diameter": 16.39, "circumference": 51.49},
  {"eu": 12, "diameter": 16.55, "circumference": 52.00},
  {"eu": 12.5, "diameter": 16.71, "circumference": 52.50},
  {"eu": 13, "diameter": 16.87, "circumference": 53.01},
  {"eu": 13.5, "diameter": 17.04, "circumference": 53.52},
  {"eu": 14, "diameter": 17.20, "circumference": 54.03},
  {"eu": 14.5, "diameter": 17.36, "circumference": 54.53},
  {"eu": 15, "diameter": 17.52, "circumference": 55.04},
  {"eu": 15.5, "diameter": 17.68, "circumference": 55.55},
  {"eu": 16, "diameter": 17.84, "circumference": 56.05},
  {"eu": 16.5, "diameter": 18.00, "circumference": 56.56},
  {"eu": 17, "diameter": 18.17, "circumference": 57.07},
  {"eu": 17.5, "diameter": 18.33, "circumference": 57.58},
  {"eu": 18, "diameter": 18.49, "circumference": 58.08},
  {"eu": 18.5, "diameter": 18.65, "circumference": 58.59},
  {"eu": 19, "diameter": 18.81, "circumference": 59.10},
  {"eu": 19.5, "diameter": 18.97, "circumference": 59.60},
  {"eu": 20, "diameter": 19.13, "circumference": 60.11},
  {"eu": 20.5, "diameter": 19.30, "circumference": 60.62},
  {"eu": 21, "diameter": 19.46, "circumference": 61.13},
  {"eu": 21.5, "diameter": 19.62, "circumference": 61.63},
  {"eu": 22, "diameter": 19.78, "circumference": 62.14},
  {"eu": 22.5, "diameter": 19.94, "circumference": 62.65},
  {"eu": 23, "diameter": 20.10, "circumference": 63.15},
  {"eu": 23.5, "diameter": 20.26, "circumference": 63.66},
  {"eu": 24, "diameter": 20.43, "circumference": 64.17},
  {"eu": 24.5, "diameter": 20.59, "circumference": 64.68},
  {"eu": 25, "diameter": 20.75, "circumference": 65.18},
  {"eu": 25.5, "diameter": 20.91, "circumference": 65.69},
  {"eu": 26, "diameter": 21.07, "circumference": 66.20},
  {"eu": 26.5, "diameter": 21.23, "circumference": 66.70},
  {"eu": 27, "diameter": 21.39, "circumference": 67.21},
  {"eu": 27.5, "diameter": 21.56, "circumference": 67.72},
  {"eu": 28, "diameter": 21.72, "circumference": 68.23},
  {"eu": 28.5, "diameter": 21.88, "circumference": 68.73},
  {"eu": 29, "diameter": 22.04, "circumference": 69.24},
  {"eu": 29.5, "diameter": 22.20, "circumference": 69.75},
  {"eu": 30, "diameter": 22.36, "circumference": 70.25},
  {"eu": 30.5, "diameter": 22.52, "circumference": 70.76},
  {"eu": 31, "diameter": 22.69, "circumference": 71.27},
  {"eu": 31.5, "diameter": 22.85, "circumference": 71.78},
  {"eu": 32, "diameter": 23.01, "circumference": 72.28},
  {"eu": 32.5, "diameter": 23.17, "circumference": 72.79},
  {"eu": 33, "diameter": 23.33, "circumference": 73.30},
  {"eu": 33.5, "diameter": 23.49, "circumference": 73.80},
  {"eu": 34, "diameter": 23.65, "circumference": 74.31},
  {"eu": 34.5, "diameter": 23.82, "circumference": 74.82},
  {"eu": 35, "diameter": 23.98, "circumference": 75.33},
  {"eu": 35.5, "diameter": 24.14, "circumference": 75.83},
  {"eu": 36, "diameter": 24.30, "circumference": 76.34},
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollDebounce;

  double diameterMm = 13.0;
  final double minDiameter = 13.0;
  final double maxDiameter = 24.3;

  Map<String, double> dpi = {"xdpi": 0.0, "ydpi": 0.0};
  late bool isTurkish;

  static const Color _bg = Color(0xFF222831);
  static const Color _ink = Color(0xFFDFD0B8);

  @override
  void initState() {
    super.initState();
    final langCode = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    isTurkish = langCode == 'tr';
    _loadDpi();
  }

  @override
  void dispose() {
    _scrollDebounce?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadDpi() async {
    final result = await DpiHelper.getDpi();
    if (!mounted) return;
    setState(() => dpi = result);
  }

  // itemExtent değerleriyle senkronize olmalı
  static const double _itemExtentNormal = 56.0;
  static const double _itemExtentCompact = 46.0;

  void _scrollToSelected() {
    if (!mounted || !_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.viewportDimension == 0) return;

    final index = sizeChart.indexed.reduce(
      (a, b) =>
          (a.$2['diameter'] - diameterMm).abs() < (b.$2['diameter'] - diameterMm).abs() ? a : b,
    ).$1;

    final itemExtent = ResponsiveHelper.isCompactScreen(context)
        ? _itemExtentCompact
        : _itemExtentNormal;

    final targetOffset = (index * itemExtent - position.viewportDimension / 2 + itemExtent / 2)
        .clamp(0.0, position.maxScrollExtent);

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _stepBackward() {
    setState(() {
      diameterMm = (diameterMm - 0.16).clamp(minDiameter, maxDiameter);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
  }

  void _stepForward() {
    setState(() {
      diameterMm = (diameterMm + 0.16).clamp(minDiameter, maxDiameter);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
  }

  Future<void> _showHelpVideo() async {
    final controller = VideoPlayerController.asset('assets/videos/help.mp4');

    try {
      await controller.initialize();
      if (!mounted) return;

      controller
        ..setLooping(true)
        ..play();

      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) => AlertDialog(
          backgroundColor: _bg,
          title: Text(
            isTurkish ? "Nasıl Kullanılır" : "How to Use",
            style: TextStyle(
              color: _ink,
              fontSize: ResponsiveHelper.fontSize(context, 16),
            ),
          ),
          content: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                // ✅ Stop playback before closing dialog
                try {
                  await controller.pause();
                } catch (_) {}

                // ✅ Use the dialog's own context (fixes async context lint)
                if (dialogContext.mounted) Navigator.pop(dialogContext);
              },
              child: Text(
                isTurkish ? "Kapat" : "Close",
                style: TextStyle(
                  color: _ink,
                  fontSize: ResponsiveHelper.fontSize(context, 14),
                ),
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      debugPrint('Help video error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isTurkish ? "Video açılamadı." : "Unable to play the video.",
            ),
          ),
        );
      }
    } finally {
      controller.dispose();
    }
  }

  Future<void> _shareOnWhatsApp(String message) async {
    final url = Uri.parse("https://wa.me/?text=${Uri.encodeComponent(message)}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (dpi["xdpi"] == 0.0) {
      // ✅ Review'da "boş ekran" gibi görünmesin
      return const Scaffold(
        backgroundColor: _bg,
        body: Center(
          child: CircularProgressIndicator(
            color: _ink,
          ),
        ),
      );
    }

    final xdpi = dpi["xdpi"]!;
    final dpr = MediaQuery.of(context).devicePixelRatio;

    // ✅ CRITICAL: Ring sizer logic UNCHANGED - exact millimeter calculation
    final maxDiameterDp = DpiHelper.mmToDp(mm: maxDiameter, dpi: xdpi, dpr: dpr) + 40;
    final currentDiameterDp = DpiHelper.mmToDp(mm: diameterMm, dpi: xdpi, dpr: dpr);

    final closestIndex = sizeChart.indexed.reduce(
      (a, b) =>
          (a.$2['diameter'] - diameterMm).abs() < (b.$2['diameter'] - diameterMm).abs() ? a : b,
    ).$1;

    final isCompact = ResponsiveHelper.isCompactScreen(context);

    const double hPad = 20.0;
    const double actionSlot = 64.0;
    const double actionIconSize = 45.0;

    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: ResponsiveHelper.spacing(context, 8)),

            // ── Başlık ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: hPad),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StoryPage()),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "BALLADEART",
                    style: TextStyle(
                      fontFamily: 'Cinzel',
                      fontSize: ResponsiveHelper.fontSize(context, 28, maxSize: 32),
                      letterSpacing: 4,
                      color: _ink,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: ResponsiveHelper.spacing(context, 16)),

            // ── Ring alanı: sol=yardım | orta=ring | sağ=paylaş ────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: hPad),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Help butonu
                  SizedBox(
                    width: actionSlot,
                    height: actionSlot,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: _showHelpVideo,
                      icon: SvgPicture.asset(
                        "assets/icons/help.svg",
                        width: actionIconSize,
                        height: actionIconSize,
                        colorFilter: const ColorFilter.mode(_ink, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Ring görseli
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final maxSquare = constraints.biggest.shortestSide;
                        final gridSize = maxDiameterDp.clamp(0.0, maxSquare);
                        final ringSize = currentDiameterDp.clamp(0.0, gridSize);

                        return Center(
                          child: SizedBox(
                            width: gridSize,
                            height: gridSize,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/grid_box.svg",
                                  width: gridSize,
                                  height: gridSize,
                                  fit: BoxFit.contain,
                                  colorFilter: const ColorFilter.mode(_ink, BlendMode.srcIn),
                                ),
                                SizedBox(
                                  width: ringSize,
                                  height: ringSize,
                                  child: const DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.fromBorderSide(
                                        BorderSide(
                                          color: _ink,
                                          width: 1.8,
                                          strokeAlign: BorderSide.strokeAlignInside,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Paylaş butonu
                  SizedBox(
                    width: actionSlot,
                    height: actionSlot,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        final item = sizeChart[closestIndex];
                        final message = isTurkish
                            ? "Yüzük ölçüm sonucu:\nÖlçü: ${item['eu']}\nÇap: ${item['diameter']} mm\nÇevre: ${item['circumference']} mm"
                            : "Ring size result:\nSize: ${item['eu']}\nDiameter: ${item['diameter']} mm\nCircumference: ${item['circumference']} mm";
                        _shareOnWhatsApp(message);
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/forward.svg",
                        width: actionIconSize,
                        height: actionIconSize,
                        colorFilter: const ColorFilter.mode(_ink, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: ResponsiveHelper.spacing(context, 8)),

            // ── Slider ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: hPad - 4),
              child: Row(
                children: [
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: _stepBackward,
                      icon: const Icon(Icons.chevron_left, color: _ink),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      activeColor: _ink,
                      inactiveColor: _ink.withValues(alpha: 0.4),
                      value: diameterMm,
                      min: minDiameter,
                      max: maxDiameter,
                      onChanged: (value) {
                        setState(() => diameterMm = value);
                        _scrollDebounce?.cancel();
                        _scrollDebounce = Timer(
                          const Duration(milliseconds: 120),
                          _scrollToSelected,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: _stepForward,
                      icon: const Icon(Icons.chevron_right, color: _ink),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: ResponsiveHelper.spacing(context, 10)),

            // ── Tablo başlığı ────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: hPad),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      isTurkish ? "Ölçü Tablosu" : "Size Chart",
                      style: TextStyle(
                        color: _ink,
                        fontSize: ResponsiveHelper.fontSize(context, 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: _ink.withValues(alpha: 0.5), width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            isTurkish ? "Ölçü" : "Size",
                            style: TextStyle(
                              color: _ink,
                              fontWeight: FontWeight.w600,
                              fontSize: ResponsiveHelper.fontSize(context, 10),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              isTurkish ? "Çap" : "Diameter",
                              style: TextStyle(
                                color: _ink,
                                fontWeight: FontWeight.w600,
                                fontSize: ResponsiveHelper.fontSize(context, 10),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              isTurkish ? "Çevre" : "Circumference",
                              style: TextStyle(
                                color: _ink,
                                fontWeight: FontWeight.w600,
                                fontSize: ResponsiveHelper.fontSize(context, 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),

            // ── Tablo ────────────────────────────────────────────────
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                itemExtent: isCompact ? _itemExtentCompact : _itemExtentNormal,
                itemCount: sizeChart.length,
                itemBuilder: (context, index) {
                  final item = sizeChart[index];
                  final isSelected = index == closestIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() => diameterMm = item['diameter']);
                      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPad),
                      child: Container(
                      margin: EdgeInsets.symmetric(vertical: isCompact ? 3 : 5),
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: isCompact ? 9 : 11,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? _ink : _ink.withValues(alpha: 0.35),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected ? _ink.withValues(alpha: 0.1) : Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${item['eu']}",
                              style: TextStyle(
                                color: _ink,
                                fontSize: ResponsiveHelper.fontSize(context, 17),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "${item['diameter']}",
                                style: TextStyle(
                                  color: _ink,
                                  fontSize: ResponsiveHelper.fontSize(context, 17),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${item['circumference']}",
                                style: TextStyle(
                                  color: _ink,
                                  fontSize: ResponsiveHelper.fontSize(context, 17),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                  );
                },
              ),
            ),

            // ── Footer: sosyal linkler ───────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hPad,
                vertical: ResponsiveHelper.spacing(context, 12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _FooterIcon(
                    asset: "assets/icons/insta.svg",
                    size: 32,
                    onTap: () async {
                      final url = Uri.parse(
                          "https://www.instagram.com/balladeart?igsh=Z3B6bHV5OWd4MXFw");
                      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                        debugPrint("Instagram linki açılamadı: $url");
                      }
                    },
                  ),
                  const SizedBox(width: 40),
                  _FooterIcon(
                    asset: "assets/icons/website.svg",
                    size: 32,
                    onTap: () async {
                      final url = Uri.parse("https://www.balladeart.com/");
                      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                        debugPrint("Website linki açılamadı: $url");
                      }
                    },
                  ),
                  const SizedBox(width: 40),
                  _FooterIcon(
                    asset: "assets/icons/location.svg",
                    size: 30,
                    onTap: () async {
                      final url = Uri.parse("https://maps.app.goo.gl/3FNax1PRdAbcfiPN7");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterIcon extends StatelessWidget {
  final String asset;
  final double size;
  final VoidCallback onTap;

  const _FooterIcon({
    required this.asset,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          asset,
          width: size,
          height: size,
          colorFilter: const ColorFilter.mode(Color(0xFFDFD0B8), BlendMode.srcIn),
        ),
      ),
    );
  }
}

