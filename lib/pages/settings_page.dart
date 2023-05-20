import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../enums/app_colors.dart';
import '../enums/app_images.dart';
import '../providers/app_theme_provider.dart';
import '../providers/dashboard_controller_provider.dart';
import '../providers/firebase_auth_state_provider.dart';
import '../routes/named_routes.dart';
import '../widgets/button_widget.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    ref.watch(providerAuthState);

    final authController = ref.read(providerAuthentication);
    final firebaseAuthController = ref.read(providerFirebaseAuth);
    final dashboardController = ref.watch(providerDashboardController.notifier);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Configuración',
            style: textTheme.titleLarge,
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Bienvenido!',
                    style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ref.read(providerAppTheme)
                            ? AppColors.white.color.withOpacity(0.65)
                            : AppColors.black.color.withOpacity(0.65)),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            " ${firebaseAuthController.currentUser?.displayName ?? ''}",
                        style: TextStyle(
                          color: ref.read(providerAppTheme)
                              ? AppColors.white.color.withOpacity(0.85)
                              : AppColors.black.color.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(
                  height: 2,
                  color: Colors.grey.shade500,
                ),
              ),
              Visibility(
                  visible: firebaseAuthController.currentUser != null,
                  child: ListTile(
                    leading: SvgPicture.asset(
                      AppImages.userConfig.asset,
                      colorFilter: ColorFilter.mode(
                          ref.read(providerAppTheme)
                              ? AppColors.grey700.color
                              : AppColors.black.color,
                          BlendMode.srcIn),
                    ),
                    title: Text("Información de usuario",
                        style: textTheme.bodyMedium),
                    trailing: const Icon(Icons.navigate_next),
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () => context.pushNamed(userInfo),
                  )),

              const SizedBox(height: 5),

              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Modo oscuro", style: textTheme.bodyMedium),
                    Switch.adaptive(
                        value: ref.read(providerAppTheme),
                        activeColor: AppColors.primary300.color,
                        activeTrackColor: AppColors.grey200.color,
                        inactiveThumbColor: AppColors.primary300.color,
                        inactiveTrackColor: AppColors.grey200.color,
                        splashRadius: 25.0,
                        onChanged: ((value) =>
                            ref.read(providerAppTheme.notifier).state = value)),
                  ],
                ),
              ),

              // Cerrar sesión
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                    visible: firebaseAuthController.currentUser != null,
                    replacement: CustomButton(
                        isDarkMode: true,
                        onPressed: () {
                          context.goNamed(root);
                          dashboardController.resetPosition();
                        },
                        text: 'Salir',
                        verticalPadding: 8),
                    child: CustomButton(
                        isDarkMode: true,
                        onPressed: () {
                          authController.signOut();
                          dashboardController.resetPosition();
                          context.goNamed(root);
                        },
                        text: 'Cerrar sesión y salir',
                        verticalPadding: 8),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
