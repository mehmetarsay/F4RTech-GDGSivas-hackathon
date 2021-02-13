import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  DocumentReference reference;
  final String _publisher; // Yorum Yapan
  final String _receiver; //Yorum Yapılan
  final String _text;

  Comment(this._publisher, this._receiver, this._text);

  Comment.fromMap(Map<String, dynamic> parsedMap, {this.reference})
      : _publisher = parsedMap['publisher'],
        _receiver = parsedMap['receiver'],
        _text = parsedMap['text'];

  Map<String, dynamic> toMap() {
    return {
      'publisher': _publisher,
      'receiver': _receiver,
      'text': _text,
    };
  }

  Comment.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  String get text => _text;

  String get receiver => _receiver;

  String get publisher => _publisher;
}
