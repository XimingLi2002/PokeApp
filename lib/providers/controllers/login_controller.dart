import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_auth_state_provider.dart';
import '../login_provider.dart';

class LoginController extends AutoDisposeNotifier<void>{
  late GlobalKey<FormState> formKey;
  late TextEditingController txtEmail;
  late TextEditingController txtPassword;

  @override
  build() {
    formKey = GlobalKey<FormState>();
    txtEmail = TextEditingController();
    txtPassword = TextEditingController();

  }
  
  bool get isHiddenPassword => ref.read(providerHiddenPassword);
  set setHiddenPassword(bool value) =>
      ref.read(providerHiddenPassword.notifier).state = value;

  Future<void> signIn(BuildContext context) async {
    FormState? formState = formKey.currentState;
    if (formState is FormState && formState.validate()) {
      await onPressedFunction(context);
      formState.save();
    }
  }

  Future<void> onPressedFunction(BuildContext context) async {
    final auth = ref.read(providerAuthentication);
    ref.read(providerLogging.notifier).state = true;
    await auth
        .signInWithEmailAndPassword(txtEmail.text, txtPassword.text, context)
        .whenComplete(() {
      ref.read(providerLogging.notifier).state = false;
    });
  }
}
