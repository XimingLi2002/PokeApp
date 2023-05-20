import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/firebase_auth_service.dart';

final providerAuthentication =
    Provider<Authentication>((ref) => Authentication());

final providerAuthState = StreamProvider<User?>(
    (ref) => ref.read(providerAuthentication).authStateChange);

final providerFirebaseAuth =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
