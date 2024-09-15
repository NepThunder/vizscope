import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class FireBaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Logger _logger = Logger();

  Future<User?> signInWithEmailAndPassword(
      String email, String password, void Function(String) onError) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // _logger.e('FirebaseAuthException code: ${e.code}, message: ${e.message}');

      if (e.code == 'user-not-found') {
        String errorMessage = 'No user found for that email.';
        onError(errorMessage);
        return null;
      } else if (e.code == 'wrong-password') {
        String errorMessage = 'Wrong password provided for that user.';
        onError(errorMessage);
        return null;
      } else if (e.code == 'invalid-credential') {
        String errorMessage = 'Invalid credential. Please try again.';
        onError(errorMessage);
        return null;
      } else if (e.code == 'too-many-requests') {
        String errorMessage = 'Too many requests. Try again later.';
        onError(errorMessage);
        return null;
      } else {
        String errorMessage = 'An unexpected error occurred: ${e.message}';
        _logger.e('Unexpected error: ${e.code}, message: ${e.message}');
        onError(errorMessage);
        return null;
      }
    } catch (e) {
      _logger.e("An unexpected error occurred during sign-in: $e");
      onError("An unexpected error occurred: $e");
      return null;
    }
  }

  Future<void> sendPasswordResetLink(String email)async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      _logger.e("An unexpected error occured");
    }
  }
  
}
