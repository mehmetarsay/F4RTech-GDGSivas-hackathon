import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;

abstract class FirestoreBase {
  Future<bool> saveUser(dynamic user);
  Future<dynamic> readUser(String uid);
}