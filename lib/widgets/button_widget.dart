import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/app_colors.dart';

class CustomButton extends ConsumerWidget {
  final bool isDarkMode;
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? horizontalPadding;
  final double verticalPadding;
  final bool? isDisabled;

  const CustomButton(
      {super.key,
      required this.isDarkMode,
      required this.text,
      required this.onPressed,
      this.width,
      this.horizontalPadding,
      required this.verticalPadding,
      this.isDisabled});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      elevation: 4,
      //Por defecto tiene un margin a los lados
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0, vertical: verticalPadding),
      color: isDarkMode ? AppColors.primary500.color : const Color(0xFFFFFFFF),
      onPressed: isDisabled ?? false ? null : onPressed,
      disabledColor: Colors.grey.shade400,
      minWidth: width ?? double.infinity,
      shape: RoundedRectangleBorder(
        side: isDarkMode
            ? BorderSide.none
            : const BorderSide(color: Color(0xFF51a13d), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : const Color(0xFF51a13d),
              fontSize: 15,
            ),
      ),
    );
  }
}
