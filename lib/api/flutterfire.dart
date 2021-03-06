import 'package:firebase_auth/firebase_auth.dart';

Future<void> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print("The password you entered istoo weak");
    } else if (e.code == 'email-already-in-use') {
      print("The email you entered is already in use");
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print(FirebaseAuth.instance.currentUser);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print("The password you entered istoo weak");
    } else if (e.code == 'email-already-in-use') {
      print("The email you entered is already in use");
    }
  } catch (e) {
    print(e.toString());
  }
}
