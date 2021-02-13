import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';

class Product {
  DocumentReference reference;
  final String _name;
  final ProductType _productType;
  final String _explanation;
  final String _publisher;

  Product(this._name, this._productType, this._explanation, this._publisher);

  Product.fromMap(Map<String, dynamic> parsedMap, {this.reference})
      : _name = parsedMap['name'],
        _productType = parsedMap['productType'],
        _explanation = parsedMap['explanation'],
        _publisher = parsedMap['publisher'];

  Map<String, dynamic> toMap() {
    return {
      'name': _name,
      'productType': _productType,
      'explanation': _explanation,
      'publisher': _publisher,
    };
  }
  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  String get publisher => _publisher;

  String get explanation => _explanation;

  ProductType get productType => _productType;

  String get name => _name;
}
