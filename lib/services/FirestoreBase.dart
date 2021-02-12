import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;

abstract class FirestoreBase {
  Future<bool> saveUser(usr.User user);
  Future<usr.User> readUser(String uid);
}