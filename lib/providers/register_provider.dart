import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'controllers/register_controller.dart';

final providerRegisterController =
    AutoDisposeNotifierProvider<RegisterController, void>(
        () => RegisterController());

final providerHiddenPassword = AutoDisposeStateProvider<bool>((ref) => true);

final providerHiddenConfirmPassword = AutoDisposeStateProvider<bool>((ref) => true);

final providerRegistering = AutoDisposeStateProvider<bool>((ref) => false);
