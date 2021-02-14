import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/sharer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/volunteer_user.dart';

class Request {
  DocumentReference reference;
  final String _id;
  final Product _requestedProduct; //İstek Yapılan Ürün
  final VolunteerUser _requesting; //İstek Yapan Kişi
  final SharerUser _requested; //İstek Yapılan Kişi
  final List _statusList;

  Request(this._id, this._requestedProduct, this._requesting, this._requested,
      this._statusList);

  Request.reference(this.reference, this._id, this._requestedProduct,
      this._requesting, this._requested, this._statusList);

  Request.fromMap(Map<String, dynamic> parsedMap, {this.reference})
      : _id = parsedMap['id'],
        _requestedProduct = parsedMap['requestedProduct'],
        _requesting = parsedMap['requesting'],
        _requested = parsedMap['requested'],
        _statusList = parsedMap['statusList'];

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'requestedProduct': _requestedProduct.id,
      'requesting': _requesting.uid,
      'requested' : _requested.uid,
      'statusList': _statusList,
    };
  }

  Request.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  String get id => _id;

  List get statusList => _statusList;

  SharerUser get requested => _requested;

  VolunteerUser get requesting => _requesting;

  Product get requestedProduct => _requestedProduct;
}
