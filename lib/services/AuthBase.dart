import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';

abstract class AuthBase{
  Future<dynamic> currentUser();
  Future<dynamic> signInWithEmailAndPassword({UserType userType,String email, String password});
  Future<dynamic> createUserWithEmailAndPassword(
      {UserType userType, String email,
      String password,
      String fullName,
      String phoneNumber,
      String companyOrInstitution});
  Future<bool> signOut();



}