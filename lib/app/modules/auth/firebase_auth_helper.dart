import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp({String? email, String? password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //UPDATE METHOD
  // Future updateProfile({
  //   String? name,
  //   String? email,
  //   String? password,
  //   String? photoURL,
  // }) async {
  //   var crrentUser = _auth.currentUser;
  //   try {
  //     await {
  //       crrentUser!.updateDisplayName(name),
  //       crrentUser.updateEmail(email!),
  //       crrentUser.updatePhotoURL(photoURL),
  //     };
  //     return null;
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }

  //SIGN IN METHOD
  Future signIn({String? email, String? password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        
        email: email!,
        password: password!,
        
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();
    print('Signout User');
  }
}
