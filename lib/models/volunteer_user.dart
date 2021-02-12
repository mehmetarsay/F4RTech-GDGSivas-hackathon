import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;

class VolunteerUser extends usr.User {
  final String institution;
  final int degree;
  final List completedProductList;
  final List commentList;
  final List requestProductList;

  VolunteerUser(
      String uid,
      String fullName,
      String email,
      UserType userType,
      String phoneNumber,
      DateTime dateOfRegistration,
      this.institution,
      this.degree,
      this.completedProductList,
      this.commentList,
      this.requestProductList)
      : super(uid, fullName, email, userType, phoneNumber, dateOfRegistration);
}
