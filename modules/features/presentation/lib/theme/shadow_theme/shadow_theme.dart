import 'package:flutter/painting.dart';

class ShadowTheme {
  ShadowTheme._();
  static final ShadowTheme instance = ShadowTheme._();

  BoxShadow get cartCardShadow => BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.16),
      spreadRadius: 0.0,
      blurRadius: 4,
      offset: Offset(0.0, 2.0));
}
