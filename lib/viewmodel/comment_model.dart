import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/locator.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/comment.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/CommentBase.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreService.dart';
import 'package:flutter/material.dart';

class CommentModel with ChangeNotifier implements CommentBase{
  CommentViewState _state = CommentViewState.Idle;
  FirestoreService _firestoreService = locator<FirestoreService>();
  List<Comment> _commentList;

  CommentModel(){
    _commentList = [];
  }


  CommentViewState get state => _state;

  set state(CommentViewState value) {
    _state = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  List<Comment> get commentList => _commentList;

  // ignore: unnecessary_getters_setters
  set commentList(List<Comment> value) {
    _commentList = value;
  }

  @override
  Future<bool> saveComment({String publisher, String receiver, String text}) async {
    try {
      state = CommentViewState.Busy;
      String _id = DateTime
          .now()
          .microsecondsSinceEpoch
          .toString();
      Comment comment = Comment(_id, publisher, receiver, text);
      if(comment != null){
        return await _firestoreService.saveComment(comment);
        /*if(result){
          return true;
        }else{
          return false;
        }*/
      }else{
        return null;
      }
    } catch (e) {
      print('CommentModel-saveComment Error: $e');
      return e;
    } finally {
      state = CommentViewState.Idle;
    }
  }

  @override
  Future<List<Comment>> readCommentForUser(String id) async {
    try {
      state = CommentViewState.Busy;
      List<Comment> _commentList = await _firestoreService.readCommentForUser(id);
      if(_commentList != null) {
        commentList = _commentList;
        return commentList;
      }else{
        return null;
      }
    } catch (e) {
      print('CommentModel-readCommentForUser Error: $e');
      return e;
    } finally {
      state = CommentViewState.Idle;
    }
  }
}