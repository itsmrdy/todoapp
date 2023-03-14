import 'package:presentation/theme/color_theme/color_theme.dart';
import 'package:presentation/theme/shadow_theme/shadow_theme.dart';

class ThemeInstances {
  static ColorTheme get colorPallete => ColorTheme.instance;
  static ShadowTheme get shadow => ShadowTheme.instance;
}
