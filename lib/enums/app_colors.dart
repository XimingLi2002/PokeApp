import 'package:flutter/material.dart';

//https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors
//Color principal: 66BB6A
//Color de errores: F24D47

enum AppColors {
  black(color: Color(0xFF000000)),
  white(color: Color(0xFFFFFFFF)),

  primary50(color: Color(0xFFe8f5e9)),
  primary100(color: Color(0xFFC8E6C9)),
  primary300(color: Color(0xFF81c784)),
  primary500(color: Color(0xFF4ca250)),

  triadic400(color: Color(0xFF44babb)),

  analogous300(color: Color(0xFF97c577)),
  analogous800(color: Color(0xFF397823)),

  grey200(color: Color(0xFFEEEEEE)),
  grey700(color: Color(0xFF616161)),
  grey800(color: Color(0xFF424242)),

  red300(color: Color(0xFFE57373)),
  red800(color: Color(0xFFC62828));

  const AppColors({required this.color});
  final Color color;
}
