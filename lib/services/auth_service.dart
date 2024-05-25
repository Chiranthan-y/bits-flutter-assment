import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:quicktask/screens/task_list_screen.dart';

class AuthService {

  Future<ParseUser?> signUp(String email, String password) async {
    final user = ParseUser(email, password, email);

    final response = await user.signUp();

    if (response.success) {
      return response.result;
    } else {
      return null;
    }
  }


  Future<ParseUser?> signIn(String email, String password) async {
    final user = ParseUser(email, password, null);

    final response = await user.login();

    if (response.success) {
      return response.result;
    } else {
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
    final ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    
    if(currentUser != null){
      final response = await currentUser.logout();
      if (response.success) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
        );
      }
    }
  }
}
