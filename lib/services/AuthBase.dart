import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;

abstract class AuthBase{
  Future<usr.User> currentUser();
  Future<usr.User> signInWithEmailAndPassword({String email, String password});
  Future<usr.User> createUserWithEmailAndPassword(
      {String email,
      String password,
      String name,
      String surname,
      String username});
  Future<bool> signOut();



}