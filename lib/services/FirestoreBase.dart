import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/user.dart' as usr;
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreBase {
  Future<bool> saveUser(dynamic user);
  Future<dynamic> readUser(String id);
  Future<bool> saveProduct(Product product);
  Future<Product> readProduct(String uid);
  Future<List<Product>> readFilteredProducts(GeoPoint location);
  Future<List<Product>> readAllProducts();
}