import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreBase.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;

class FirestoreService implements FirestoreBase{
  @override
  Future<usr.User> readUser(String uid) {
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUser(usr.User user) {
    throw UnimplementedError();
  }

}