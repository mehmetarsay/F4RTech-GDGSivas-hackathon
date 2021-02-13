import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';

abstract class ProductBase{
  Future<bool> saveProduct({String name, ProductType productType, String explanation});
  Future<Product> readProduct(String id);
  Future<List<Product>> readAllProducts();
  Future<List<Product>> readFilteredProducts(GeoPoint location);
}