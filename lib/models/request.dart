import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';

class Request {
  DocumentReference reference;
  final String _requestedProduct; //İstek Yapılan Ürün
  final String _requesting; //İstek Yapan
  final RequestStatus _status;

  Request(this._requestedProduct, this._requesting, this._status);

  Request.fromMap(Map<String, dynamic> parsedMap, {this.reference})
      : _requestedProduct = parsedMap['requestedProduct'],
        _requesting = parsedMap['requesting'],
        _status = parsedMap['status'];

  Map<String, dynamic> toMap() {
    return {
      'requestedProduct': _requestedProduct,
      'requesting': _requesting,
      'status': _status,
    };
  }

  Request.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  RequestStatus get status => _status;

  String get requesting => _requesting;

  String get requestedProduct => _requestedProduct;
}
