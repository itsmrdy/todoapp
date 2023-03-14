import 'package:flutter/material.dart';

/// An actuator provides information about the current state of a specific page
/// and an optional action button to trigger a certain task.
class Actuator extends StatelessWidget {
  /// An actuator that displays an icon.
  const Actuator.icon({
    required this.description,
    required this.title,
    required this.iconData,
    this.buttonText = 'Action',
    this.mainAxisSize = MainAxisSize.max,
    this.onPressed,
    Key? key,
  })  : localImage = null,
        super(key: key);

  /// An actuator that displays a local image.
  const Actuator.image({
    required this.description,
    required this.title,
    required this.localImage,
    this.buttonText = 'Action',
    this.mainAxisSize = MainAxisSize.max,
    this.onPressed,
    Key? key,
  })  : iconData = null,
        super(key: key);

  final String description;
  final MainAxisSize mainAxisSize;
  final String title;
  final String buttonText;

  final void Function()? onPressed;

  final IconData? iconData;
  final String? localImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (iconData != null)
          Icon(iconData, size: 60)
        else
          Image.asset(localImage!, width: 220),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Flexible(child: Text(description, textAlign: TextAlign.center)),
        const SizedBox(height: 20),
        if (onPressed != null)
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 270),
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ),
      ],
    );
  }
}
