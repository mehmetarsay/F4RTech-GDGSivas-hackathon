import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;
import 'package:f4rtech_gdgsivas_hackathon/services/AuthBase.dart';

class AuthService implements AuthBase{
  @override
  Future<usr.User> createUserWithEmailAndPassword({String email, String password, String name, String surname, String username}) {
    throw UnimplementedError();
  }

  @override
  Future<usr.User> currentUser() {
    throw UnimplementedError();
  }

  @override
  Future<usr.User> signInWithEmailAndPassword({String email, String password}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    throw UnimplementedError();
  }

}