import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password) async{

    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch(e){
      print("Some Error");
    }
    return null;
  }
  Future<User?> signInWithEmailAndPassword(String email, String password) async{

    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch(e){
      print("Some Error");
    }
    return null;
  }

  // Gửi gmail nếu quên pass
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
          msg: "Email đã được gửi thành công.");
    } catch (e) {
      print("Đã xảy ra lỗi khi đặt lại mật khẩu: $e");
      Fluttertoast.showToast(msg: "Đã xảy ra lỗi khi đặt lại mật khẩu: $e");
    }
  }
}