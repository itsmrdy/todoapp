import 'package:flutter/material.dart';

class InfoSnackbar {
  InfoSnackbar(this.context);

  final BuildContext context;

  /// Shows an info snackbar.
  ///
  /// Ensure that the [message] is at max 60 characters so that the message is
  /// not bloated.
  void show(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
