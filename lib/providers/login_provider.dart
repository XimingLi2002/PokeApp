import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/login_controller.dart';

final providerLoginController =
    AutoDisposeNotifierProvider<LoginController, void>(() => LoginController());

final providerHiddenPassword = AutoDisposeStateProvider<bool>((ref) => true);

final providerLogging = AutoDisposeStateProvider<bool>((ref) => false);