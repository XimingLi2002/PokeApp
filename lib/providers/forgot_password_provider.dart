import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/forgot_password_controller.dart';

final providerForgotPasswordProvider =
    AutoDisposeNotifierProvider<ForgotPasswordController, void>(() => ForgotPasswordController());

final providerSendingEmail = AutoDisposeStateProvider<bool>((ref) => false);