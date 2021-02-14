import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/locator.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/AuthBase.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/AuthService.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;
import 'package:geolocator/geolocator.dart';

class UserModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  AuthService _authService = locator<AuthService>();
  FirestoreService _firestoreService = locator<FirestoreService>();
  var _user;
  var _differentUser;
  Position currentLocation;

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


  set differentUser(value) {
    _differentUser = value;
  }

  @override
  Future<dynamic> differentUserFunc(String uid) async {
    try {
      state = ViewState.Busy;
      differentUser = await _firestoreService.readUser(uid);
      return differentUser;

    } catch (e) {
      print('UserModel-currentUser Error: $e');
      return e;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<dynamic> currentUser() async {
    try {
      state = ViewState.Busy;
      User userAuth = await _authService.currentUser();
      await determinePosition();
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
      var _user = await _authService.createUserWithEmailAndPassword(
          userType: userType,
          email: email,
          password: password,
          fullName: fullName,
          phoneNumber: phoneNumber,
          companyOrInstitution: companyOrInstitution);
      if (_user != null) {
        var result = await _firestoreService.saveUser(_user);
        if (result) {
          user = _user;
          return user;
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
      bool result =  await _authService.signOut();
      if(result){
        user = null;
        return true;
      }else {
        return false;
      }
    } catch (e) {
      print('UserModel-signOut Error: $e');
      return e;
    } finally {
      state = ViewState.Idle;
    }
  }
  Future<Position> determinePosition() async {
    try{
      state=ViewState.Busy;
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }
    currentLocation = await Geolocator.getCurrentPosition();
    return currentLocation;
  }
  catch(e){
      print('permission sorun olustu $e');
      return e;
  }
    finally {
      state = ViewState.Idle;
    }
  }
}
