import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_auth_state_provider.dart';
import '../register_provider.dart';

class RegisterController extends AutoDisposeNotifier<void> {
  late GlobalKey<FormState> formKey;
  late TextEditingController txtUsername;
  late TextEditingController txtEmail;
  late TextEditingController txtPassword;
  late TextEditingController txtConfirmPassword;

  @override
  build() {
    formKey = GlobalKey<FormState>();
    txtUsername = TextEditingController();
    txtEmail = TextEditingController();
    txtPassword = TextEditingController();
    txtConfirmPassword = TextEditingController();
  }

  bool get isHiddenPassword => ref.read(providerHiddenPassword);
  set setHiddenPassword(bool value) =>
      ref.read(providerHiddenPassword.notifier).state = value;

  bool get isHiddenConfirmPassword => ref.read(providerHiddenConfirmPassword);
  set setHiddenConfirmPassword(bool value) =>
      ref.read(providerHiddenConfirmPassword.notifier).state = value;

  Future<void> signUp(BuildContext context) async {
    FormState? formState = formKey.currentState;
    if (formState is FormState && formState.validate()) {
      await onPressedFunction(context);
      formState.save();
    }
  }

  Future<void> onPressedFunction(BuildContext context) async {
    final auth = ref.read(providerAuthentication);
    ref.read(providerRegistering.notifier).state = true;
    await auth
        .signUpWithEmailAndPassword(
            txtUsername.text, txtEmail.text, txtPassword.text, context)
        .whenComplete(() {
      ref.read(providerRegistering.notifier).state = false;
    });
  }
}
