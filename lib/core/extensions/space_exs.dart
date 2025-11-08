import 'package:flutter/material.dart';

extension IntExtention on int? {
  int validate({int value  = 0}) {
    return this ?? value;
  }

  Widget get s => SizedBox(
    height: this?.toDouble(),
  );

  Widget get l => SizedBox(
    width: this?.toDouble(),
  );
}