import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/sharer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;
import 'package:f4rtech_gdgsivas_hackathon/models/volunteer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/AuthBase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService implements AuthBase {
  @override
  Future<dynamic> createUserWithEmailAndPassword(
      {UserType userType,
      String email,
      String password,
      String fullName,
      String phoneNumber,
      String companyOrInstitution}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        if (userType == UserType.VOLUNTEER) {
          return VolunteerUser(
              userCredential.user.uid,
              fullName,
              email,
              userType.toString(),
              phoneNumber,
              DateTime.now(),
              companyOrInstitution,
              0, [], [], []);
        } else if (userType == UserType.SHARER) {
          return SharerUser(
              userCredential.user.uid,
              fullName,
              email,
              userType.toString(),
              phoneNumber,
              DateTime.now(),
              companyOrInstitution,
              [],
              0,
              []);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('AuthService-createUserWithEmailAndPassword Error: $e');
      return e;
    }
  }

  @override
  Future<User> currentUser() async {
    try {
      User user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print('AuthService-currentUser Error: $e');
      return e;
    }
  }

  @override
  Future<dynamic> signInWithEmailAndPassword(
      {UserType userType, String email, String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential != null) {
        return userCredential.user;
      } else {
        return null;
      }
    } catch (e) {
      print('AuthService-signInWithEmailAndPassword Error: $e');
      return e;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print('AuthService-signOut Error: $e');
      return e;
    }
  }
}
