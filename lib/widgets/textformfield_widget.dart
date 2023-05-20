import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/app_colors.dart';

class CustomTextFormField extends ConsumerWidget {
  final String title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextStyle? errorTextStyle;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final bool? obscureText;

  const CustomTextFormField(
      {super.key,
      this.obscureText,
      this.keyboardType,
      this.enableSuggestions,
      this.autocorrect,
      this.suffixIcon,
      this.prefixIcon,
      this.validator,
      this.errorTextStyle,
      required this.title,
      required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    OutlineInputBorder customOutlineInputBorder(Color borderSideColor) {
      return OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderSideColor));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: textTheme.bodySmall!
                .copyWith(color: AppColors.black.color.withOpacity(0.8)),
            textAlign: TextAlign.left),
        const SizedBox(height: 2),
        Row(children: [
          Expanded(
              child: TextFormField(
                  obscureText: obscureText ?? false,
                  controller: controller,
                  validator: validator,
                  enableSuggestions: enableSuggestions ?? true,
                  autocorrect: autocorrect ?? true,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      suffixIconConstraints:
                          const BoxConstraints(minWidth: 6, minHeight: 6),
                      prefixIcon: prefixIcon,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 8),
                      suffixIcon: suffixIcon,
                      enabledBorder: customOutlineInputBorder(
                          AppColors.analogous300.color),
                      focusedBorder: customOutlineInputBorder(
                          AppColors.analogous800.color),
                      errorBorder: customOutlineInputBorder(
                          AppColors.red300.color),
                      focusedErrorBorder:
                          customOutlineInputBorder(AppColors.red800.color),
                      errorStyle: textTheme.bodySmall!.copyWith(
                          color: AppColors.red800.color,
                          overflow: TextOverflow.ellipsis),
                      errorMaxLines: 2)))
        ]),
      ],
    );
  }
}
