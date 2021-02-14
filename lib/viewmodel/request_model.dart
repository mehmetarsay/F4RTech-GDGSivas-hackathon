import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/locator.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/request.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/sharer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/volunteer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreService.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/RequestBase.dart';
import 'package:flutter/material.dart';

class RequestModel with ChangeNotifier implements RequestBase {
  RequestViewState _state = RequestViewState.Idle;
  FirestoreService _firestoreService = locator<FirestoreService>();
  List<Request> _requestList;
  Request _request;
  RequestModel() {
    requestList = [];
    readAllRequest();
  }

  RequestViewState get state => _state;

  set state(RequestViewState value) {
    _state = value;
    notifyListeners();
  }

  Request get request => _request;

  set request(Request value) {
    _request = value;
  }

  List<Request> get requestList => _requestList;

  set requestList(List<Request> value) {
    _requestList = value;
    //notifyListeners();
  }

  @override
  Future<bool> saveRequest({Product requestedProduct, SharerUser requested, VolunteerUser requesting}) async {
    try {
      state = RequestViewState.Busy;
      String _id = DateTime.now().microsecondsSinceEpoch.toString();
      Request request = Request(_id, requestedProduct, requesting, requested, [RequestStatus.WAITING.toString()]);
      if (request != null) {
         return await _firestoreService.saveRequest(request);
      }
    } catch (e) {
      print('RequestModel-saveRequest Error: $e');
      return e;
    } finally {
      state = RequestViewState.Idle;
    }
  }

  @override
  Future<Request> readRequest(String id) async{
    try {
      state = RequestViewState.Busy;
      Request _request = await _firestoreService.readRequest(id);
      if (_request != null) {
        request = _request;
        return request;
      } else {
        return null;
      }
    } catch (e) {
      print('RequestModel-readRequest Error: $e');
      return e;
    } finally {
      state = RequestViewState.Idle;
    }
  }

  @override
  Future<List<Request>> readAllRequest() async {
    try {
      state = RequestViewState.Busy;
      var _requestList = await _firestoreService.readAllRequest();
      if (_requestList != null) {
        requestList = _requestList;

        return requestList;
      } else {
        return null;
      }
    } catch (e) {
      print('RequestModel-readAllRequest Error: $e');
      return e;
    } finally {
      state = RequestViewState.Idle;
    }
    state = RequestViewState.Idle;
  }

  @override
  Future<List<Request>> readFilteredRequest(String requesting) async{
    try {
      state = RequestViewState.Busy;
      var _requestList = await _firestoreService.readFilteredRequest(requesting);
      if (_requestList != null) {
        requestList = _requestList;
        return requestList;
      } else {
        return null;
      }
    } catch (e) {
      print('RequestModel-readFilteredRequest Error: $e');
      return e;
    } finally {
      state = RequestViewState.Idle;
    }
  }


}
