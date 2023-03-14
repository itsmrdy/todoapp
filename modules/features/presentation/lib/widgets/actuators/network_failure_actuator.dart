import 'package:flutter/material.dart';
import 'package:presentation/widgets/actuators/failure_actuator.dart';

class NetworkFailureActuator extends StatelessWidget {
  const NetworkFailureActuator({
    this.mainAxisSize = MainAxisSize.max,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final MainAxisSize mainAxisSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FailureActuator(
      iconData: Icons.wifi_off,
      mainAxisSize: mainAxisSize,
      title: 'Oops! No internet connection',
      description: 'Slow or no internet connection detected.\n'
          'Please check your internet connection and try again.',
      onPressed: onPressed,
    );
  }
}
