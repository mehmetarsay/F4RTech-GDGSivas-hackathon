import 'package:f4rtech_gdgsivas_hackathon/models/comment.dart';

abstract class CommentBase{
  Future<bool> saveComment({String publisher, String receiver, String text});
  Future<List<Comment>> readCommentForUser(String id);
}