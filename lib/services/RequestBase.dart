import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/request.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/sharer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/volunteer_user.dart';

abstract class RequestBase{
  Future<bool> saveRequest({Product requestedProduct, SharerUser requested, VolunteerUser requesting});
  Future<Request> readRequest(String id);
  Future<List<Request>> readAllRequest();
  Future<List<Request>> readFilteredRequest(String requesting);
}