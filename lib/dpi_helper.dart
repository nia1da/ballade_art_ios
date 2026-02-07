import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';

class DpiHelper {
  // iPhone 6'dan iPhone 17/Air'e kadar tüm modellerin PPI değerleri
  static const Map<String, double> _iosPPI = {
    // --- SİMÜLATÖRLER ---
    'x86_64': 460.0, // Intel Mac Simülatörü
    'arm64': 460.0,  // Apple Silicon Simülatörü

    // --- GELECEK MODELLER (2025/2026 - Tahmini & Dosya Verisi) ---
    'iPhone18,4': 460.0, // iPhone Air
    'iPhone18,2': 460.0, // iPhone 17 Pro Max
    'iPhone18,1': 460.0, // iPhone 17 Pro
    'iPhone18,3': 460.0, // iPhone 17

    // --- iPHONE 16 SERİSİ (A18 Çip) ---
    'iPhone17,5': 460.0, // iPhone 16e
    'iPhone17,2': 460.0, // iPhone 16 Pro Max
    'iPhone17,1': 460.0, // iPhone 16 Pro
    'iPhone17,4': 460.0, // iPhone 16 Plus
    'iPhone17,3': 460.0, // iPhone 16

    // --- iPHONE 15 SERİSİ (A17/A16 Çip) ---
    'iPhone16,2': 460.0, // iPhone 15 Pro Max
    'iPhone16,1': 460.0, // iPhone 15 Pro
    'iPhone15,5': 460.0, // iPhone 15 Plus
    'iPhone15,4': 460.0, // iPhone 15

    // --- iPHONE 14 SERİSİ ---
    'iPhone15,3': 460.0, // iPhone 14 Pro Max
    'iPhone15,2': 460.0, // iPhone 14 Pro
    'iPhone14,8': 458.0, // iPhone 14 Plus (Dosyaya göre 458)
    'iPhone14,7': 460.0, // iPhone 14

    // --- iPHONE 13 SERİSİ ---
    'iPhone14,3': 458.0, // iPhone 13 Pro Max
    'iPhone14,2': 460.0, // iPhone 13 Pro
    'iPhone14,5': 460.0, // iPhone 13
    'iPhone14,4': 476.0, // iPhone 13 mini

    // --- iPHONE 12 SERİSİ ---
    'iPhone13,4': 458.0, // iPhone 12 Pro Max
    'iPhone13,3': 460.0, // iPhone 12 Pro
    'iPhone13,2': 460.0, // iPhone 12
    'iPhone13,1': 476.0, // iPhone 12 mini

    // --- iPHONE 11 SERİSİ ---
    'iPhone12,5': 458.0, // iPhone 11 Pro Max
    'iPhone12,3': 458.0, // iPhone 11 Pro
    'iPhone12,1': 326.0, // iPhone 11 (LCD Ekran)

    // --- iPHONE SE SERİSİ ---
    'iPhone14,6': 326.0, // iPhone SE (3. Nesil)
    'iPhone12,8': 326.0, // iPhone SE (2. Nesil)
    'iPhone8,4': 326.0,  // iPhone SE (1. Nesil)

    // --- iPHONE X / XS / XR SERİSİ ---
    'iPhone11,8': 326.0, // iPhone XR
    'iPhone11,6': 458.0, // iPhone XS Max
    'iPhone11,4': 458.0, // iPhone XS Max
    'iPhone11,2': 458.0, // iPhone XS
    'iPhone10,6': 458.0, // iPhone X (Global)
    'iPhone10,3': 458.0, // iPhone X (GSM)

    // --- iPHONE 8 SERİSİ ---
    'iPhone10,5': 401.0, // iPhone 8 Plus
    'iPhone10,2': 401.0, // iPhone 8 Plus
    'iPhone10,4': 326.0, // iPhone 8
    'iPhone10,1': 326.0, // iPhone 8

    // --- iPHONE 7 SERİSİ ---
    'iPhone9,4': 401.0, // iPhone 7 Plus
    'iPhone9,2': 401.0, // iPhone 7 Plus
    'iPhone9,3': 326.0, // iPhone 7
    'iPhone9,1': 326.0, // iPhone 7

    // --- iPHONE 6s SERİSİ ---
    'iPhone8,2': 401.0, // iPhone 6s Plus
    'iPhone8,1': 326.0, // iPhone 6s

    // --- iPHONE 6 SERİSİ ---
    'iPhone7,1': 401.0, // iPhone 6 Plus
    'iPhone7,2': 326.0, // iPhone 6

    // Varsayılan (Bilinmeyen model gelirse OLED standardı)
    'default': 460.0,
  };

  /// 1 milimetrenin ekranda kaç fiziksel piksele denk geldiğini hesaplar.
  static double pixelsPerMm(double dpi) {
    return dpi / 25.4;
  }

  /// Cihazın model kodunu bulur ve haritadan PPI değerini çeker.
  static Future<double> getDevicePPI() async {
    if (Platform.isIOS) {
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        String model = iosInfo.utsname.machine;
        
        // Modeli listede arar, bulamazsa varsayılanı döndürür
        return _iosPPI[model] ?? _iosPPI['default']!;
      } catch (e) {
        return 460.0; // Hata durumunda güvenli değer
      }
    }
    // Android veya diğer platformlar için standart değer
    return 160.0;
  }

  /// Tasarımda milimetre kullanmak için çevirici fonksiyon
  static double mmToDp({required double mm, required double dpi, required double dpr}) {
    // Formül: (mm * ppi / 25.4) / device_pixel_ratio
    return mm * (dpi / 25.4) / dpr;
  }
}
