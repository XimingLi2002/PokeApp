import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_auth_state_provider.dart';
import '../forgot_password_provider.dart';

class ForgotPasswordController extends AutoDisposeNotifier<void> {
  late GlobalKey<FormState> formKey;
  late TextEditingController txtEmail;

  @override
  build() {
    formKey = GlobalKey<FormState>();
    txtEmail = TextEditingController();
  }

  Future<void> recoverPassword(BuildContext context) async {
    FormState? formState = formKey.currentState;
    if (formState is FormState && formState.validate()) {
      await onPressedFunction(context);
      formState.save();
    }
  }

  Future<void> onPressedFunction(BuildContext context) async {
    final auth = ref.read(providerAuthentication);
    ref.read(providerSendingEmail.notifier).state = true;
    await auth.sendPasswordResetEmail(txtEmail.text, context).whenComplete(() {
      ref.read(providerSendingEmail.notifier).state = false;
    });
  }
}
