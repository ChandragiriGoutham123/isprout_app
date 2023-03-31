import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ISproutScrollBehavior extends MaterialScrollBehavior {
  const ISproutScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}