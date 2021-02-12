import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;

class SharerUser extends usr.User {
  final String company;
  final List sharedProductList;
  final int shareProductCount;
  final List incomingRequestProductList;

  SharerUser(
      String uid,
      String fullName,
      String email,
      UserType userType,
      String phoneNumber,
      DateTime dateOfRegistration,
      this.company,
      this.sharedProductList,
      this.shareProductCount,
      this.incomingRequestProductList)
      : super(uid, fullName, email, userType, phoneNumber, dateOfRegistration);
}
