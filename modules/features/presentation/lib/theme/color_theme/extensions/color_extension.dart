import 'package:flutter/material.dart';

extension ColorExtensions on Color {
  Color get shade100 => (this).withOpacity(0.1);
  Color get shade200 => (this).withOpacity(0.2);
  Color get shade300 => (this).withOpacity(0.3);
  Color get shade400 => (this).withOpacity(0.4);
  Color get shade500 => (this).withOpacity(0.5);
  Color get shade600 => (this).withOpacity(0.6);
  Color get shade700 => (this).withOpacity(0.7);
  Color get shade800 => (this).withOpacity(0.8);
  Color get shade900 => (this).withOpacity(0.9);
}
