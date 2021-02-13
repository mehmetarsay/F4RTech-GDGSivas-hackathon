import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';

abstract class User {
  DocumentReference reference;
  final String uid;
  final String fullName;
  final String email;
  final String userType;
  final String phoneNumber;
  final DateTime dateOfRegistration;

  User(this.uid, this.fullName, this.email, this.userType, this.phoneNumber,
      this.dateOfRegistration);

  User.fromMap(Map<String, dynamic> parsedMap, {this.reference})
      : uid = parsedMap['uid'],
        fullName = parsedMap['fullName'],
        email = parsedMap['email'],
        userType = parsedMap['userType'],
        phoneNumber = parsedMap['phoneNumber'],
        dateOfRegistration = (parsedMap['dateOfRegistration'] as Timestamp).toDate();

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'userType': userType,
      'phoneNumber': phoneNumber,
      'dateOfRegistration': dateOfRegistration,
    };
  }

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

}
