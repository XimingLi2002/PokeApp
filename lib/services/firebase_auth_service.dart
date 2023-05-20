import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/named_routes.dart';

class Authentication {
  // Instantiate [FirebaseAuth to be able to use its functions
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // [Stream<User?> get] returns a Stream of User object, it will be used to check if the user is logged in or not.
  Stream<User?> get authStateChange => _auth.authStateChanges();

  //  SigIn the user using Email and Password
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        if (_auth.currentUser != null) context.goNamed(home);
      });
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Ha ocurrido un error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  // SignUp the user using Email and Password
  Future<void> signUpWithEmailAndPassword(String username, String email,
      String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        await result.user!
            .updateDisplayName(username)
            .whenComplete(() => context.goNamed(root));
      }
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                  title: const Text('Error Occured'),
                  content: Text(e.toString()),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text("OK"))
                  ]));
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  //  SignOut the current user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  //Future -> permite crear operaciones de larga duración sin bloquear el hilo principal y el uso de operaciones asincrónicas
  Future<void> sendPasswordResetEmail(
      String email, BuildContext context) async {
    try {
      //await -> espera hasta que termine la tarea
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text(
                  '¡Enlace de restablecimiento de contraseña enviado! Compruebe su correo electrónico'),
            );
          });

      //captura el error en caso de que el correo electrónico sea inválido.
    } on FirebaseAuthException catch (e) {
      //cuando aparece un error en flutter con catch nos describe directamente el error,
      //algunos de los mensajes que nos devuelve en este caso sería:
      //The email address is badly formatted.
      //There is no user record corresponding to this identifier. The user may have been deleted.

      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                  title: const Text('Error Occured'),
                  content: Text(e.toString()),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text("OK"))
                  ]));
    }
  }
}
