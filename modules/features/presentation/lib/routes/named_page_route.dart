import 'package:flutter/material.dart';

/// Returns a [MaterialPageRoute] with a named route settings.
///
/// By using this route, this enables page tracking from analytic services such
/// as Google Analytics 4 by automatically providing a named route.
///
/// The type `V` specifies the widget type that will be built by the route.
///
/// The type `T` specifies the return type of the route which can be supplied
/// as the route is popped from the stack via [Navigator.pop] by providing the
/// optional `result` argument.
class NamedPageRoute<V extends Widget, T> extends MaterialPageRoute<T> {
  NamedPageRoute({required V Function(BuildContext context) builder})
      : super(
          builder: builder,
          settings: RouteSettings(name: '$V'),
        );
}
