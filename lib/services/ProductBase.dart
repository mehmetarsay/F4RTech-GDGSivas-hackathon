import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

abstract class ProductBase{
  Future<bool> saveProduct({String name, ProductType productType, String explanation, Asset file, GeoPoint geoPoint});
  Future<Product> readProduct(String id);
  Future<List<Product>> readAllProducts();
  Future<List<Product>> readFilteredProducts(double radius);
}