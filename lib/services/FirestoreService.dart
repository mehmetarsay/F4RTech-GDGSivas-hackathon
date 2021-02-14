import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/comment.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/request.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/sharer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/volunteer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreBase.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class FirestoreService implements FirestoreBase {
  @override
  Future<bool> saveUser(dynamic user) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (result != null) {
        await result.reference.set(user.toMap());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('FirestoreService-saveUser Error: $e');
      return e;
    }
  }

  @override
  Future<dynamic> readUser(String uid) async {
    try {
      var result =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (result != null) {
        if (UserType.VOLUNTEER.toString() == result.data()['userType']) {
          VolunteerUser user = VolunteerUser.fromSnapshot(result);
          return user;
        } else if (UserType.SHARER.toString() == result.data()['userType']) {
          SharerUser user = SharerUser.fromSnapshot(result);
          return user;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('FirestoreService-readUser Error: $e');
      return e;
    }
  }

  @override
  Future<bool> saveProduct(Product product) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('products')
          .doc(product.id)
          .get();
      if (result != null) {
        await result.reference.set(product.toMap());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('FirestoreService-saveProduct Error: $e');
      return false;
    }
  }

  @override
  Future<Product> readProduct(String id) async {
    try {
      var result =
          await FirebaseFirestore.instance.collection('products').doc(id).get();
      if (result != null) {
        Product product = Product.fromSnapshot(result);
        return product;
      } else {
        return null;
      }
    } catch (e) {
      print('FirestoreService-readProduct Error: $e');
      return e;
    }
  }

  @override
  Future<List<Product>> readAllProducts() async {
    try {
      var result =
          await FirebaseFirestore.instance.collection('products').get();
      if (result != null) {
        List<Product> products = [];
        result.docs.forEach((element) {
          products.add(Product.fromSnapshot(element));
        });
        return products;
      } else {
        return null;
      }
    } catch (e) {
      print('FirestoreService-readAllProducts Error: $e');
      return e;
    }
  }

  @override
  Future<List<Product>> readFilteredProducts(double radius) async {
    try {
      List<Product> allProducts = await readAllProducts();
      if (allProducts != null) {
        print('denemeee'+allProducts.length.toString());
        Position currentLocation=await Geolocator.getCurrentPosition();
        List<Product> filteredProducts=[];
        for(int i=0;i<allProducts.length;++i)
            {
              if(Geolocator.distanceBetween(currentLocation.latitude, currentLocation.longitude, allProducts[i].location.latitude, allProducts[i].location.longitude)<=radius) {
                print((Geolocator.distanceBetween(currentLocation.latitude, currentLocation.longitude, allProducts[i].location.latitude, allProducts[i].location.longitude).toString()));
                filteredProducts.add(allProducts[i]);
              }
            }
        return filteredProducts;
          }
      else {
        return null;
      }
    } catch (e) {
      print('FirestoreService-readFilteredProducts Error: $e');
      return e;
    }
  }

  @override
  Future<bool> saveRequest(Request request) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('requests')
          .doc(request.id)
          .get();
      if (result != null) {
        await result.reference.set(request.toMap());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('FirestoreService-saveRequest Error: $e');
      return false;
    }
  }

  @override
  Future<Request> readRequest(String id) async {
    try {
      var result =
          await FirebaseFirestore.instance.collection('requests').doc(id).get();
      if (result != null) {
        var requestedProduct =
            await readProduct(result.data()['requestedProduct']);
        var requesting = await readUser(result.data()['requesting']);
        var requested = await readUser(result.data()['requested']);
        Request request = Request.reference(
            result.reference,
            result.id,
            requestedProduct,
            requesting,
            requested,
            result.data()['statusList']);
        return request;
      } else {
        return null;
      }
    } catch (e) {
      print('FirestoreService-readRequest Error: $e');
      return e;
    }
  }

  Future<List<Request>> readRequestFromQDSList2(List<QueryDocumentSnapshot> docs)async{
    List<Request> list = [];
    await Future.forEach(docs, (element) async{
      Request res = await readRequstFromQDS(element);
      if(res != null){
        list.add(res);
      }
    });
    return list;

  }

  Future<List<Request>> readRequestsFromQDSList(List<QueryDocumentSnapshot> docs) async {
    try{
      List<Request> list = [];
      list = await readRequestFromQDSList2(docs);
      if(list != null){
        return list;
      }else {
        return null;
      }
    }catch(e){
      print(e);
      return e;
    }
  }

  Future<Request> readRequstFromQDS(QueryDocumentSnapshot element) async{
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

  @override
  Future<List<Request>> readAllRequest() async {
    try {
      var result =
          await FirebaseFirestore.instance.collection('requests').get();
      if (result != null) {
        List<Request> requests = [];
        requests = await readRequestsFromQDSList(result.docs);
        print('A');
        if(requests.isEmpty){
          return requests;
        }else{
          return requests;
        }

      } else {
        return null;
      }
    } catch (e) {
      print('FirestoreService-readAllRequest Error: $e');
      return e;
    }
  }

  @override
  Future<List<Request>> readFilteredRequest(String requesting) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('requests')
          .where('requesting', isEqualTo: requesting)
          .get();
      if (result != null) {
        List<Request> requests = [];
        requests = await readRequestsFromQDSList(result.docs);
        if(requests.isEmpty){
          return requests;
        }else{
          return requests;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('FirestoreService-readFilteredRequest Error: $e');
      return e;
    }
  }

  @override
  Future<bool> saveComment(Comment comment) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('comments')
          .doc(comment.id)
          .get();
      if (result != null) {
        await result.reference.set(comment.toMap());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('FirestoreService-saveComment Error: $e');
      return false;
    }
  }

  @override
  Future<List<Comment>> readCommentForUser(String id) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('comments')
          .where('receiver', isEqualTo: id)
          .get();
      if (result != null) {
        List<Comment> comments = [];
        result.docs.forEach((element) {
          comments.add(Comment.fromSnapshot(element));
        });
        return comments;
      } else {
        return null;
      }
    } catch (e) {
      print('FirestoreService-readCommentForUser Error: $e');
      return e;
    }
  }
}
