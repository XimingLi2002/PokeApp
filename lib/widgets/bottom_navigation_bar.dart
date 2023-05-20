import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../enums/app_images.dart';
import '../enums/app_colors.dart';
import '../providers/app_theme_provider.dart';
import '../providers/dashboard_controller_provider.dart';
import '../routes/named_routes.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  ConsumerState<CustomBottomNavigationBar> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<CustomBottomNavigationBar> {
  void _onTap(int index) {
    ref.read(providerDashboardController.notifier).setPosition(index);
    switch (index) {
      case 0:
        context.goNamed(home);
        break;
      case 1:
        context.go('/pokedex');
        break;
      case 2:
        context.goNamed(game);
        break;
      case 3:
        context.go('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(providerAppTheme);
    final position = ref.watch(providerDashboardController);
    return BottomNavigationBar(
        currentIndex: position,
        onTap: (value) => _onTap(value),
        items: [
          customBottomNavigationBarItem(AppImages.home.asset, "Inicio", null, ref.read(providerAppTheme)),
          customBottomNavigationBarItem(AppImages.pokedex.asset, "Pokedex",
              null, ref.read(providerAppTheme)),
          customBottomNavigationBarItem(
              AppImages.game.asset,
              "Game",
              AppColors.black.color.withOpacity(0.35),
              ref.read(providerAppTheme)),
          customBottomNavigationBarItem(AppImages.config.asset, "Configuración",
              null, ref.read(providerAppTheme)),
        ]);
  }
}

BottomNavigationBarItem customBottomNavigationBarItem(
    String asset, String label, Color? backgroundColor, bool isDarkMode) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      asset,
      colorFilter: ColorFilter.mode(
          isDarkMode
              ? AppColors.white.color.withOpacity(0.5)
              : AppColors.grey800.color.withOpacity(0.4),
          BlendMode.srcIn),
      width: 24,
    ),
    activeIcon: SvgPicture.asset(
      asset,
      colorFilter: ColorFilter.mode(
          isDarkMode ? AppColors.white.color : AppColors.grey800.color,
          BlendMode.srcIn),
      width: 26,
    ),
    label: label,
    backgroundColor: backgroundColor ??
        (isDarkMode ? AppColors.black.color : AppColors.primary300.color),
  );
}
