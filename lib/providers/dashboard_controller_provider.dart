import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/dashboard_controller.dart';

/// [providerDashboardController] controller that takes care of the value of the bottom navigation bar
final providerDashboardController =
    StateNotifierProvider<DashboardController, int>(
        (ref) => DashboardController(0));
