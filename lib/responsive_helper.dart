import 'package:flutter/widgets.dart';

class ResponsiveHelper {
  /// Returns a minimalist font size that scales slightly on larger screens.
  ///
  /// Example:
  /// - iPhone SE (375w): 16.0
  /// - iPhone 14 Pro (393w): 16.5
  /// - iPhone 14 Pro Max (430w): 18.0
  ///
  /// Prevents "amateur percentage scaling" by clamping growth.
  static double fontSize(BuildContext context, double baseSize, {double? maxSize}) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Base reference: iPhone 14 Pro (393 logical width)
    const double baseWidth = 393.0;
    
    // Allow slight growth: +0.1 per 10px screen width increase
    final scaleFactor = (screenWidth - baseWidth) / 100.0 * 0.5;
    final scaledSize = baseSize + scaleFactor;
    
    // Clamp to maxSize (default: baseSize + 3)
    final clampMax = maxSize ?? (baseSize + 3.0);
    return scaledSize.clamp(baseSize - 1.0, clampMax);
  }

  /// Returns responsive vertical spacing.
  /// Smaller on compact screens, breathes more on large screens.
  static double spacing(BuildContext context, double baseSpacing) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    // iPhone SE 3rd Gen: 667, iPhone 14 Pro Max: 932
    if (screenHeight < 700) {
      return baseSpacing * 0.75; // Compact
    } else if (screenHeight > 850) {
      return baseSpacing * 1.3; // Breathe
    }
    return baseSpacing;
  }

  /// Returns true if screen is compact (iPhone SE, iPhone 13 mini)
  static bool isCompactScreen(BuildContext context) {
    return MediaQuery.of(context).size.height < 700;
  }
}
