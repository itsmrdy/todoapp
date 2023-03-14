import 'package:flutter/material.dart';

class ErrorSnackbar {
  ErrorSnackbar(this.context);

  final BuildContext context;

  /// Shows an error snackbar.
  ///
  /// Ensure that the [message] is at max 60 characters so that the message is
  /// not bloated.
  void show(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
