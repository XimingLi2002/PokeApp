import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../enums/app_colors.dart';

class UserInfoPage extends ConsumerWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_outlined,
            size: 24,
          ),
          onTap: () => context.pop(),
        ),
        title: Text("Información del usuario", style: textTheme.titleLarge),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Próximamente",
                  style: textTheme.bodyLarge!
                      .copyWith(color: AppColors.grey700.color.withOpacity(0.5)),
                ),
                Text(
                  "(Poder cambiar tu nombre de usuario, contraseña...)",
                  style: textTheme.bodyMedium!
                      .copyWith(color: AppColors.grey700.color.withOpacity(0.5)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
