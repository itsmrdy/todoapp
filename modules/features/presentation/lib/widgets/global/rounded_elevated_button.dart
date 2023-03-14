import 'package:flutter/material.dart';
import 'package:presentation/theme/constants/source_sans_pro_text.dart';

class RoundedElevatedButton extends StatelessWidget {
  const RoundedElevatedButton({
    required this.buttonText,
    required this.onPressed,
    this.textColor = Colors.white,
    this.height = 50,
  });

  final String? buttonText;
  final Function()? onPressed;
  final Color? textColor;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.indigo, borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText!,
          style: kSourceSanProTitle13.copyWith(color: textColor),
        ),
      ),
    );
  }
}
