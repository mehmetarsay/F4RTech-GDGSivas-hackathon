import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;

class VolunteerUser extends usr.User {
  final String _institution;
  final int _degree;
  final List _completedProductList;
  final List _commentList;
  final List _requestProductList;

  VolunteerUser(
      String uid,
      String fullName,
      String email,
      String userType,
      String phoneNumber,
      DateTime dateOfRegistration,
      this._institution,
      this._degree,
      this._completedProductList,
      this._commentList,
      this._requestProductList)
      : super(uid, fullName, email, userType, phoneNumber, dateOfRegistration);

  VolunteerUser.fromMap(Map<String, dynamic> parsedMap,
      {DocumentReference reference})
      : _institution = parsedMap['institution'],
        _degree = parsedMap['degree'],
        _completedProductList = parsedMap['completedProductList'],
        _commentList = parsedMap['commentList'],
        _requestProductList = parsedMap['requestProductList'],
        super.fromMap(parsedMap, reference: reference);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'userType': userType,
      'phoneNumber': phoneNumber,
      'institution': _institution,
      'degree': _degree,
      'completedProductList': _completedProductList,
      'commentList': _commentList,
      'requestProductList': _requestProductList,
    };
  }
  VolunteerUser.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  List get requestProductList => _requestProductList;

  List get commentList => _commentList;

  List get completedProductList => _completedProductList;

  int get degree => _degree;

  String get institution => _institution;
}
