import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/comment.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/request.dart';

abstract class FirestoreBase {
  Future<bool> saveUser(dynamic user);
  Future<dynamic> readUser(String id);
  Future<bool> saveProduct(Product product);
  Future<Product> readProduct(String uid);
  Future<List<Product>> readAllProducts();
  Future<List<Product>> readFilteredProducts(double radius);
  Future<bool> saveRequest(Request request);
  Future<Request> readRequest(String id);
  Future<List<Request>> readRequestFromQDSList2(List<QueryDocumentSnapshot> docs);
  Future<List<Request>> readRequestsFromQDSList(List<QueryDocumentSnapshot> docs);
  Future<Request> readRequestFromQDS(QueryDocumentSnapshot element) async{
    try{
      var requestedProduct = await readProduct(element.data()['requestedProduct']);
      var requesting = await readUser(element.data()['requesting']);
      var requested = await readUser(element.data()['requested']);
      Request request = Request.reference(
          element.reference,
          element.id,
          requestedProduct,
          requesting,
          requested,
          element.data()['statusList']);
      return request;
    }catch(e){
      print(e);
      return e;
    }
  }
  Future<List<Request>> readAllRequest();
  Future<List<Request>> readFilteredRequest(String requesting);
  Future<bool> saveComment(Comment comment);
  Future<List<Comment>> readCommentForUser(String id);
}