import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


import '../enums/app_colors.dart';
import '../enums/app_images.dart';
import '../providers/register_provider.dart';
import '../routes/named_routes.dart';
import '../utils/validators.dart';
import '../widgets/button_widget.dart';
import '../widgets/textformfield_widget.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final hiddenPasswordController = ref.watch(providerHiddenPassword);
    final hiddenConfirmPasswordController =
        ref.watch(providerHiddenConfirmPassword);
    final registerController = ref.watch(providerRegisterController.notifier);

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
                  //Imagen
                  //Se puede ver el tamaño de la imagen si le pontemos lo almacenamos en un Container y le damos un color (es decir el background)
                  Image(
                      image: AssetImage(AppImages.logo.asset),
                      fit: BoxFit.fitWidth,
                      width: 240,
                      filterQuality: FilterQuality.high),

                  const SizedBox(height: 25),

                  //Hello Again!
                  Text('REGISTER', style: GoogleFonts.bebasNeue(fontSize: 52)),
                  Text(
                    'Regístrese a continuación con sus datos.',
                    style: textTheme.bodyMedium,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  Form(
                    key: registerController.formKey,
                    child: Column(
                      children: [
                        //Nombre de usuario
                        CustomTextFormField(
                          title: "Nombre de usuario",
                          keyboardType: TextInputType.name,
                          controller: registerController.txtUsername,
                          prefixIcon: Icon(
                            Icons.verified_user,
                            color: AppColors.black.color.withOpacity(0.75),
                            size: 26,
                          ),
                          validator: (value) {
                            if (value!.isEmpty || !isValidUsername(value)) {
                              return 'Nombre inválido. Debe tener entre 3 y 16 caracteres y tenga cuidado con los símbolos.';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        //Correo electrónico
                        CustomTextFormField(
                          title: "Correo electrónico",
                          keyboardType: TextInputType.emailAddress,
                          controller: registerController.txtEmail,
                          prefixIcon: Icon(
                            Icons.email,
                            color: AppColors.black.color.withOpacity(0.75),
                            size: 26,
                          ),
                          validator: (value) {
                            if (value!.isEmpty || !isValidEmail(value)) {
                              return 'Correo inválido (formato incorrecto).';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        //Password Textfield
                        CustomTextFormField(
                          obscureText: hiddenPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          enableSuggestions: false,
                          autocorrect: false,
                          title: "Contraseña",
                          controller: registerController.txtPassword,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: GestureDetector(
                              onTap: () =>
                                  registerController.setHiddenPassword =
                                      !registerController.isHiddenPassword,
                              child: SvgPicture.asset(
                                registerController.isHiddenPassword
                                    ? AppImages.view.asset
                                    : AppImages.hide.asset,
                                colorFilter: ColorFilter.mode(
                                    AppColors.black.color.withOpacity(0.75),
                                    BlendMode.srcIn),
                                width: 26,
                              ),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColors.black.color.withOpacity(0.75),
                            size: 26,
                          ),
                          validator: (value) {
                            if (value!.isEmpty || !isValidPassword(value)) {
                              return 'Debe tener al menos 8 caracteres y contener un número, una minúscula y una mayúscula.';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10),

                        //Confirm Password Textfield
                        CustomTextFormField(
                          obscureText: hiddenConfirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          enableSuggestions: false,
                          autocorrect: false,
                          title: "Confirmar contraseña",
                          controller: registerController.txtConfirmPassword,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: GestureDetector(
                              onTap: () => registerController
                                      .setHiddenConfirmPassword =
                                  !registerController.isHiddenConfirmPassword,
                              child: SvgPicture.asset(
                                registerController.isHiddenConfirmPassword
                                    ? AppImages.view.asset
                                    : AppImages.hide.asset,
                                colorFilter: ColorFilter.mode(
                                    AppColors.black.color.withOpacity(0.75),
                                    BlendMode.srcIn),
                                width: 26,
                              ),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColors.black.color.withOpacity(0.75),
                            size: 26,
                          ),
                          validator: (value) {
                            if (registerController.txtPassword.text !=
                                registerController.txtConfirmPassword.text) {
                              return 'No concuerdan las contraseñas';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  //sign in button
                  ref.read(providerRegistering)
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          isDarkMode: true,
                          onPressed: () {
                            registerController.signUp(context);
                          },
                          width: double.infinity,
                          text: "Iniciar sesión",
                          verticalPadding: 12.5),

                  const SizedBox(height: 10),

                  // I am a member! Login now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ya eres miembro?',
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColors.black.color.withOpacity(0.7),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.goNamed(login),
                        child: Text(
                          ' Loguéate aquí',
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.triadic400.color,
                          ),
                        ),
                      )
                    ],
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
