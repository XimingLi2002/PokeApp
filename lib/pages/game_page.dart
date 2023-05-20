import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/app_colors.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Game",
          style: textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Center(
          child: Text(
            "Próximamente",
            style:
                textTheme.displaySmall!.copyWith(color: AppColors.grey700.color.withOpacity(0.5)),
          ),
        ),
      )),
    );
  }
}
