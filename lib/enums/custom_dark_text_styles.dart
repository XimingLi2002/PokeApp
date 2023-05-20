import 'package:flutter/material.dart';

enum CustomDarkTextStyles {
  displayLarge(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView displayLarge',
          fontFamily: 'Roboto',
          color: Colors.black54,
          decoration: TextDecoration.none)),
  displayMedium(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView displayMedium',
          fontFamily: 'Roboto',
          color: Colors.black54,
          decoration: TextDecoration.none)),
  displaySmall(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView displaySmall',
          fontFamily: 'Roboto',
          color: Colors.black54,
          decoration: TextDecoration.none)),
  headlineLarge(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView headlineLarge',
          fontFamily: 'Roboto',
          color: Colors.black54,
          decoration: TextDecoration.none)),
  headlineMedium(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView headlineMedium',
          fontFamily: 'Roboto',
          color: Colors.black54,
          decoration: TextDecoration.none)),
  headlineSmall(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView headlineSmall',
          fontFamily: 'Roboto',
          color: Colors.black87,
          decoration: TextDecoration.none)),
  titleLarge(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView titleLarge',
          fontFamily: 'Roboto',
          color: Colors.black87,
          decoration: TextDecoration.none)),
  titleMedium(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView titleMedium',
          fontFamily: 'Roboto',
          color: Colors.black87,
          decoration: TextDecoration.none)),
  titleSmall(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView titleSmall',
          fontFamily: 'Roboto',
          color: Colors.black,
          decoration: TextDecoration.none)),
  bodyLarge(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView bodyLarge',
          fontFamily: 'Roboto',
          color: Colors.black87,
          decoration: TextDecoration.none)),
  bodyMedium(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView bodyMedium',
          fontFamily: 'Roboto',
          color: Colors.black87,
          decoration: TextDecoration.none)),
  bodySmall(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView bodySmall',
          fontFamily: 'Roboto',
          color: Colors.black54,
          decoration: TextDecoration.none)),
  labelLarge(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView labelLarge',
          fontFamily: 'Roboto',
          color: Colors.black87,
          decoration: TextDecoration.none)),
  labelMedium(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView labelMedium',
          fontFamily: 'Roboto',
          color: Colors.black,
          decoration: TextDecoration.none)),
  labelSmall(
      textStyle: TextStyle(
          debugLabel: 'blackMountainView labelSmall',
          fontFamily: 'Roboto',
          color: Colors.black,
          decoration: TextDecoration.none));

  const CustomDarkTextStyles({
    required this.textStyle,
  });
  final TextStyle textStyle;
}
