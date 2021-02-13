import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/sharer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/volunteer_user.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreBase.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;

class FirestoreService implements FirestoreBase {
  @override
  Future<dynamic> readUser(String uid) async {
    try {
      var result =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (result != null) {
        if ('VOLUNTEER' == result.data()['userType']) {
          VolunteerUser user = VolunteerUser.fromSnapshot(result);
          return user;
        } else if ('SHARER' == result.data()['userType']) {
          SharerUser user = SharerUser.fromSnapshot(result);
          return user;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('Error $e');
      return e;
    }
  }

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
      print('saveUser Error: $e');
      return e;
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
  Future<List<Product>> readFilteredProducts(GeoPoint location) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('products')
          .where('location', isEqualTo: location)
          .get();
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
      print('FirestoreService-readProduct Error: $e');
      return e;
    }
  }

  @override
  Future<List<Product>> readAllProducts() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('products')
          .get();
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
}
