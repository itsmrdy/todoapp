import 'package:flutter/material.dart';
import 'package:presentation/widgets/actuators/actuator.dart';

/// A substitute widget rendered when some widget fails to load.
///
/// This provides an actionable button that can trigger an alternative action.
class FailureActuator extends StatelessWidget {
  const FailureActuator({
    required this.description,
    this.iconData = Icons.warning,
    this.mainAxisSize = MainAxisSize.max,
    this.title = 'Oops! Something went wrong',
    this.buttonText = 'Retry',
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String description;
  final IconData iconData;
  final MainAxisSize mainAxisSize;
  final String title;
  final String buttonText;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Actuator.icon(
      description: description,
      mainAxisSize: mainAxisSize,
      title: title,
      iconData: iconData,
      buttonText: buttonText,
      onPressed: onPressed,
    );
  }
}
