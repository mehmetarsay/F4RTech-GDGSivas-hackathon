import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';

abstract class User{
  final String uid;
  final String fullName;
  final String email;
  final UserType userType;
  final String phoneNumber;
  final DateTime dateOfRegistration;

  User(this.uid, this.fullName, this.email, this.userType, this.phoneNumber,
      this.dateOfRegistration);
}