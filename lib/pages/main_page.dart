import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../enums/app_colors.dart';
import '../enums/app_images.dart';
import '../providers/firebase_auth_state_provider.dart';
import '../routes/named_routes.dart';
import '../widgets/button_widget.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    ref.watch(providerAuthState);
    final currentFirebaseAuth = ref.read(providerFirebaseAuth).currentUser;
    final authController = ref.read(providerAuthentication);
    return Scaffold(
      backgroundColor: AppColors.primary50.color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 30),
        
                    //Logo
                    Image(
                        image: AssetImage(AppImages.logo.asset),
                        fit: BoxFit.fitWidth,
                        width: 300,
                        filterQuality: FilterQuality.high),
        
                    const SizedBox(height: 15),
        
                    // Nombre App
                    Text("Pokemon App", 
                        style: Theme.of(context).textTheme.headlineLarge)
                  ],
                ),
                Column(
                  children: [
                    currentFirebaseAuth == null
                        ?
                        // Iniciar sesión -> Login
                        CustomButton(
                            isDarkMode: true,
                            text: 'Iniciar sesión',
                            onPressed: () => context.goNamed(login),
                            verticalPadding: 12)
                        :
                        // Iniciar sesión como [User] -> Home
                        CustomButton(
                            isDarkMode: true,
                            text:
                                'Iniciar sesión como ${currentFirebaseAuth.displayName}',
                            onPressed: () => context.goNamed(home),
                            verticalPadding: 12),
                    // Poder cerrar sesión si existe
                    Visibility(
                      visible: currentFirebaseAuth != null,
                      child: SizedBox(
                        height: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '¿Quieres iniciar sesión con otra cuenta?',
                              style: textTheme.bodyMedium!.copyWith(
                                color: AppColors.grey700.color,
                              ),
                            ),
                            GestureDetector(
                              onTap: authController.signOut,
                              child: Text(
                                'Cerrar sesión',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors
                                          .triadic400.color,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
        
                    // SizeBox - o
                    SizedBox(
                      height: 24,
                      child: Row(
                        children: <Widget>[
                          const Expanded(
                            child: Divider(thickness: 2, endIndent: 8),
                          ),
                          Text(
                            "O",
                            style: textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Expanded(
                            child: Divider(thickness: 2, indent: 8),
                          ),
                        ],
                      ),
                    ),
        
                    // MaterialButton - Continuar sin iniciar sesión
                    CustomButton(
                        isDarkMode: false,
                        text: 'Continuar sin iniciar sesión',
                        onPressed: () {
                          context.goNamed(home);
                          authController.signOut();
                        },
                        verticalPadding: 12),
                    const SizedBox(height: 3),
        
                    // Text - Esta opción cerrará tu sesión actual
                    Text(
                      "Esta opción cerrará tu sesión actual",
                      style: textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
