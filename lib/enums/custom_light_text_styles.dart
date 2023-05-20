import 'package:flutter/material.dart';

enum CustomLightTextStyles {
  displayLarge(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView displayLarge',
          fontFamily: 'Roboto',
          color: Colors.white70,
          decoration: TextDecoration.none)),
  displayMedium(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView displayMedium',
          fontFamily: 'Roboto',
          color: Colors.white70,
          decoration: TextDecoration.none)),
  displaySmall(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView displaySmall',
          fontFamily: 'Roboto',
          color: Colors.white70,
          decoration: TextDecoration.none)),
  headlineLarge(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView headlineLarge',
          fontFamily: 'Roboto',
          color: Colors.white70,
          decoration: TextDecoration.none)),
  headlineMedium(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView headlineMedium',
          fontFamily: 'Roboto',
          color: Colors.white70,
          decoration: TextDecoration.none)),
  headlineSmall(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView headlineSmall',
          fontFamily: 'Roboto',
          color: Colors.white,
          decoration: TextDecoration.none)),
  titleLarge(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView titleLarge',
          fontFamily: 'Roboto',
          color: Colors.white,
          decoration: TextDecoration.none)),
  titleMedium(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView titleMedium',
          fontFamily: 'Roboto',
          color: Colors.white,
          decoration: TextDecoration.none)),
  titleSmall(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView titleSmall',
          fontFamily: 'Roboto',
          color: Colors.white,
          decoration: TextDecoration.none)),
  bodyLarge(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView bodyLarge',
          fontFamily: 'Roboto',
          color: Colors.white,
          decoration: TextDecoration.none)),
  bodyMedium(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView bodyMedium',
          fontFamily: 'Roboto',
          color: Colors.white,
          decoration: TextDecoration.none)),
  bodySmall(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView bodySmall',
          fontSize: 14,
          fontFamily: 'Roboto',
          color: Colors.white70,
          decoration: TextDecoration.none)),
  labelLarge(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView labelLarge',
          fontFamily: 'Roboto',
          color: Colors.white,
          decoration: TextDecoration.none)),
  labelMedium(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView labelMedium',
          fontFamily: 'Roboto',
          color: Colors.white,
          decoration: TextDecoration.none)),
  labelSmall(
      textStyle: TextStyle(
          debugLabel: 'whiteMountainView labelSmall',
          fontFamily: 'Roboto',
          color: Colors.white,
          decoration: TextDecoration.none));

  const CustomLightTextStyles({
    required this.textStyle,
  });
  final TextStyle textStyle;
}
