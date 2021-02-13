import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  DocumentReference reference;
  final String _id;
  final String _name;
  final String _productType;
  final String _explanation;
  final String _publisher;
  final GeoPoint _location;
  final String _imageUrl;

  Product(this._id, this._name, this._productType, this._explanation,
      this._publisher, this._location, this._imageUrl);

  Product.fromMap(Map<String, dynamic> parsedMap, {this.reference})
      : _id = parsedMap['id'],
        _name = parsedMap['name'],
        _productType = parsedMap['productType'],
        _explanation = parsedMap['explanation'],
        _publisher = parsedMap['publisher'],
        _location = parsedMap['location'],
        _imageUrl = parsedMap['url'];

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': _name,
      'productType': _productType,
      'explanation': _explanation,
      'publisher': _publisher,
      'location': _location,
      'url': _imageUrl,
    };
  }

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  String get imageUrl => _imageUrl;

  String get id => _id;

  String get publisher => _publisher;

  String get explanation => _explanation;

  String get productType => _productType;

  String get name => _name;

  @override
  String toString() {
    return 'Product{_id: $_id, _name: $_name, _productType: $_productType, _explanation: $_explanation, _publisher: $_publisher, _location: $_location, _imageUrl: $_imageUrl}';
  }
}
