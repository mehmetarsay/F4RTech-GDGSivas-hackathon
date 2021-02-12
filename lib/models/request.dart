import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';

class Request {
  final String requestedProduct; //İstek Yapılan Ürün
  final String requesting; //İstek Yapan
  final RequestStatus status;

  Request(this.requestedProduct, this.requesting, this.status);
}