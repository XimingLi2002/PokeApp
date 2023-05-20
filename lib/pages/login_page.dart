import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


import '../enums/app_colors.dart';
import '../enums/app_images.dart';
import '../providers/login_provider.dart';
import '../routes/named_routes.dart';
import '../utils/validators.dart';
import '../widgets/button_widget.dart';
import '../widgets/textformfield_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final loggingController = ref.watch(providerLogging);
    final loginController = ref.watch(providerLoginController.notifier);

    final hiddenPasswordController = ref.watch(providerHiddenPassword);

    //Scaffold es como un widget principal es decir la pantalla completa
    return Scaffold(
      backgroundColor: AppColors.primary50.color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 2),
          child: Center(
            //Evita que el teclado se sobreponga sobre los componentes
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                      image: AssetImage(AppImages.logo.asset),
                      fit: BoxFit.fitWidth,
                      width: 240,
                      filterQuality: FilterQuality.high),

                  const SizedBox(height: 25),

                  //Hello Again!
                  Text('LOGIN', style: GoogleFonts.bebasNeue(fontSize: 52)),
                  Text(
                    'Bienvenido de nuevo, te hemos echado de menos.',
                    style: textTheme.bodyMedium,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  Form(
                    key: loginController.formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          title: "Correo electrónico",
                          keyboardType: TextInputType.emailAddress,
                          controller: loginController.txtEmail,
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

                        const SizedBox(height: 10),

                        // Contraseña
                        CustomTextFormField(
                          obscureText: hiddenPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          enableSuggestions: false,
                          autocorrect: false,
                          title: "Contraseña",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: GestureDetector(
                              onTap: () => loginController.setHiddenPassword =
                                  !loginController.isHiddenPassword,
                              child: SvgPicture.asset(
                                loginController.isHiddenPassword
                                    ? AppImages.view.asset
                                    : AppImages.hide.asset,
                                colorFilter: ColorFilter.mode(
                                    AppColors.black.color.withOpacity(0.75),
                                    BlendMode.srcIn),
                                width: 26,
                              ),
                            ),
                          ),
                          controller: loginController.txtPassword,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColors.black.color.withOpacity(0.75),
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  //Forget password?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(recoverPassword);
                        },
                        child: Text('Recuperar contraseña',
                            style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.triadic400.color)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  //sign in button
                  Visibility(
                      visible: loggingController,
                      replacement: CustomButton(
                          isDarkMode: true,
                          onPressed: () => loginController.signIn(context),
                          width: double.infinity,
                          text: "Iniciar sesión",
                          verticalPadding: 12.5),
                      child: const Center(child: CircularProgressIndicator())),

                  const SizedBox(height: 10),

                  //not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('¿No eres miembro?',
                          style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.black.color.withOpacity(0.7))),
                      GestureDetector(
                        onTap: () => context.goNamed(register),
                        child: Text(
                          ' Regístrate aquí',
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.triadic400.color,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 2),

                  //volver
                  InkWell(
                    child: GestureDetector(
                      onTap: () => context.goNamed(root),
                      child: Text(
                        'Volver',
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.triadic400.color,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
