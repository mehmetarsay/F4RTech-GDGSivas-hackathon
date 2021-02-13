import 'package:f4rtech_gdgsivas_hackathon/models/request.dart';

abstract class RequestBase{
  Future<bool> saveRequest({String requestedProduct, String requesting});
  Future<Request> readRequest(String id);
  Future<List<Request>> readAllRequest();
  Future<List<Request>> readFilteredRequest(String requesting);
}