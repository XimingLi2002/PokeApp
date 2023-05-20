import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/pages/user_info_page.dart';

import '../models/pokemon.dart';
import '../pages/dashboard_page.dart';
import '../pages/forgot_password_page.dart';
import '../pages/game_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/main_page.dart';
import '../pages/pokedex_page.dart';
import '../pages/pokemon_details_page.dart';
import '../pages/register_page.dart';
import '../pages/settings_page.dart';
import 'named_routes.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: root,
        parentNavigatorKey: _rootNavigator,
        builder: (context, state) {
          return MainPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/login',
        name: login,
        parentNavigatorKey: _rootNavigator,
        builder: (context, state) {
          return LoginPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/register',
        name: register,
        parentNavigatorKey: _rootNavigator,
        builder: (context, state) {
          return RegisterPage(
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/recover_password',
        name: recoverPassword,
        parentNavigatorKey: _rootNavigator,
        builder: (context, state) {
          return ForgotPasswordPage(
            key: state.pageKey,
          );
        },
      ),
      ShellRoute(
          navigatorKey: _shellNavigator,
          builder: (context, state, child) =>
              DashboardPage(key: state.pageKey, child: child),
          routes: [
            GoRoute(
              path: '/home',
              name: home,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: const HomePage(), key: state.pageKey);
              },
            ),
            GoRoute(
                path: '/pokedex',
                name: pokedex,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: const PokedexWidget(), key: state.pageKey);
                },
                routes: [
                  GoRoute(
                    path: 'pokemon_details',
                    name: pokemonDetails,
                    parentNavigatorKey: _rootNavigator,
                    builder: (context, state) {
                      return PokemonDetailsPage(
                          pokemon: state.extra as Pokemon);
                    },
                  )
                ]),
            GoRoute(
              path: '/game',
              name: game,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: const GamePage(), key: state.pageKey);
              },
            ),
            GoRoute(
                path: '/settings',
                name: settings,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                      child: const SettingsPage(), key: state.pageKey);
                },
                routes: [
                  GoRoute(
                    path: 'user_info',
                    name: userInfo,
                    parentNavigatorKey: _rootNavigator,
                    builder: (context, state) {
                      return UserInfoPage(key: state.pageKey);
                    },
                  )
                ]),
          ])
    ],
  );
});
