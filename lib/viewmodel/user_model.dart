import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/locator.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/AuthBase.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/AuthService.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  AuthService _authService = locator<AuthService>();
  FirestoreService _firestoreService = locator<FirestoreService>();
  var _user;
  var _differentUser;

  UserModel() {
    currentUser();
  }

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  get user => _user;

  set user(value) {
    _user = value;
  }

  get differentUser => _differentUser;

  @override
  Future<dynamic> currentUser() async {
    try {
      state = ViewState.Busy;
      User userAuth = await _authService.currentUser();
      if (userAuth != null) {
        user = await _firestoreService.readUser(userAuth.uid);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print('UserModel-currentUser Error: $e');
      return e;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<dynamic> createUserWithEmailAndPassword(
      {UserType userType,
      String email,
      String password,
      String fullName,
      String phoneNumber,
      String companyOrInstitution}) async {
    try {
      state = ViewState.Busy;
      var user = await _authService.createUserWithEmailAndPassword(
          userType: userType,
          email: email,
          password: password,
          fullName: fullName,
          phoneNumber: phoneNumber,
          companyOrInstitution: companyOrInstitution);
      if (user != null) {
        var result = await _firestoreService.saveUser(user);
        if (result) {
          _user = await _firestoreService.readUser(user.uid);
          return _user;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('UserModel-createUserWithEmailAndPassword Error: $e');
      return e;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<dynamic> signInWithEmailAndPassword(
      {UserType userType, String email, String password}) async {
    try {
      state = ViewState.Busy;
      User userAuth = await _authService.signInWithEmailAndPassword(
          userType: userType, email: email, password: password);
      if (userAuth != null) {
        var usr = await _firestoreService.readUser(userAuth.uid);
        if (usr != null) {
          user = usr;
          return user;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('UserModel-signInWithEmailAndPassword Error: $e');
      return e;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      return await _authService.signOut();
    } catch (e) {
      print('UserModel-signOut Error: $e');
      return e;
    } finally {
      state = ViewState.Idle;
    }
  }
}
