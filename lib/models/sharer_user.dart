import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;

class SharerUser extends usr.User {
  final String _company;
  final List _sharedProductList;
  final int _shareProductCount;
  final List _incomingRequestProductList;

  SharerUser(
      String uid,
      String fullName,
      String email,
      String userType,
      String phoneNumber,
      DateTime dateOfRegistration,
      this._company,
      this._sharedProductList,
      this._shareProductCount,
      this._incomingRequestProductList)
      : super(uid, fullName, email, userType, phoneNumber, dateOfRegistration);

  SharerUser.fromMap(Map<String, dynamic> parsedMap,
      {DocumentReference reference})
      : _company = parsedMap['company'],
        _sharedProductList = parsedMap['sharedProductList'],
        _shareProductCount = parsedMap['shareProductCount'],
        _incomingRequestProductList = parsedMap['incomingRequestProductList'],
        super.fromMap(parsedMap, reference: reference);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'userType': userType,
      'phoneNumber': phoneNumber,
      'company': _company,
      'sharedProductList': _sharedProductList,
      'shareProductCount': _shareProductCount,
      'incomingRequestProductList': _incomingRequestProductList,
    };
  }

  SharerUser.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  List get incomingRequestProductList => _incomingRequestProductList;

  int get shareProductCount => _shareProductCount;

  List get sharedProductList => _sharedProductList;

  String get company => _company;
}
