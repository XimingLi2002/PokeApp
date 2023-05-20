import 'package:flutter/material.dart';

//Para poder usar los HexColor hay que escribir 0xFF sustituyendo el # 
//En lugar de escribir Color(0xFF666666) -> HexColor.fromHex(#666666) ==> son lo mismo
class HexColor {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length <= 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
