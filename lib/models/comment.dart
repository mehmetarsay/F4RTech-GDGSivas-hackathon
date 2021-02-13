import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  DocumentReference reference;
  final String _id;
  final String _publisher; // Yorum Yapan
  final String _receiver; //Yorum Yapılan
  final String _text;

  Comment(this._id,this._publisher, this._receiver, this._text);

  Comment.fromMap(Map<String, dynamic> parsedMap, {this.reference})
      : _id = parsedMap['id'],
        _publisher = parsedMap['publisher'],
        _receiver = parsedMap['receiver'],
        _text = parsedMap['text'];

  Map<String, dynamic> toMap() {
    return {
      'id' : _id,
      'publisher': _publisher,
      'receiver': _receiver,
      'text': _text,
    };
  }

  Comment.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  String get id => _id;

  String get text => _text;

  String get receiver => _receiver;

  String get publisher => _publisher;

  @override
  String toString() {
    return 'Comment{_id: $_id, _publisher: $_publisher, _receiver: $_receiver, _text: $_text}';
  }
}
