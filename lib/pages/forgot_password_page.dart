import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../enums/app_colors.dart';
import '../enums/app_images.dart';
import '../providers/forgot_password_provider.dart';
import '../routes/named_routes.dart';
import '../utils/validators.dart';
import '../widgets/button_widget.dart';
import '../widgets/textformfield_widget.dart';

class ForgotPasswordPage extends ConsumerWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final forgotPasswordController =
        ref.watch(providerForgotPasswordProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.primary50.color,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center(
            child: SingleChildScrollView(
          child: Column(children: [
            Image(
                image: AssetImage(AppImages.logo.asset),
                fit: BoxFit.fitWidth,
                width: 240,
                filterQuality: FilterQuality.high),
            const SizedBox(height: 25),
            //Hello Again!
            Text(
              'RECUPERAR CONTRASEÑA',
              style: GoogleFonts.bebasNeue(fontSize: 42),
              textAlign: TextAlign.center,
            ),
            Text(
              'Introduzca su dirección de correo electrónico. Recibirás un enlace para crear una nueva contraseña por correo electrónico.',
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Form(
              key: forgotPasswordController.formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    title: "Correo electrónico",
                    keyboardType: TextInputType.emailAddress,
                    controller: forgotPasswordController.txtEmail,
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColors.black.color.withOpacity(0.75),
                      size: 26,
                    ),
                    validator: (value) {
                      if (value!.isEmpty || !isValidEmail(value)) {
                        return 'Correo inválido (formato incorrecto)';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //Cambiar contraseña
            CustomButton(
                isDarkMode: true,
                onPressed: () =>
                    forgotPasswordController.recoverPassword(context),
                width: double.infinity,
                text: "Cambiar contraseña",
                verticalPadding: 12.5),
            const SizedBox(height: 2),
            //Volver a login
            CustomButton(
                isDarkMode: true,
                onPressed: () => context.goNamed(login),
                width: double.infinity,
                text: "Volver",
                verticalPadding: 12.5),
          ]),
        )),
      )),
    );
  }
}
