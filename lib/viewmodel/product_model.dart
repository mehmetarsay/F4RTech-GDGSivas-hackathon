import 'package:cloud_firestore_platform_interface/src/geo_point.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/AuthService.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/ProductBase.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/locator.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreService.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/StorageService.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:geolocator/geolocator.dart';

class ProductModel with ChangeNotifier implements ProductBase {
  ProductViewState _state = ProductViewState.Idle;
  FirestoreService _firestoreService = locator<FirestoreService>();
  StorageService _storageService = locator<StorageService>();
  Product _product;
  List<Product> _productList;
  String address;

  ProductViewState get state => _state;


  ProductModel() {
    _productList = [];
  }


  set state(ProductViewState value) {
    _state = value;
    notifyListeners();
  }

  Product get product => _product;

  set product(Product value) {
    _product = value;
  }


  List<Product> get productList => _productList;

  set productList(List<Product> value) {
    _productList = value;
    //notifyListeners();
  }

  @override
  Future<Product> readProduct(String id) async {
    try {
      state = ProductViewState.Busy;
      Product _product = await _firestoreService.readProduct(id);
      if (_product != null) {
        product = _product;
        return product;
      } else {
        return null;
      }
    } catch (e) {
      print('ProductModel-readProduct Error: $e');
      return e;
    } finally {
      state = ProductViewState.Idle;
    }
  }

  @override
  Future<List<Product>> readFilteredProducts(double radius) async{
    try {
      state = ProductViewState.Busy;
      List<Product> _productList = await _firestoreService.readFilteredProducts(radius);
      if (_productList != null) {
        productList = _productList;
        return productList;
      } else {
        return null;
      }
    } catch (e) {
      print('ProductModel-readAllProducts Error: $e');
      return e;
    } finally {
      state = ProductViewState.Idle;
    }
  }

  @override
  Future<bool> saveProduct({String name,
    ProductType productType,
    String explanation,
    String publisher,GeoPoint geoPoint,Asset file}) async {
    try {
      state = ProductViewState.Busy;
      String _id = DateTime
          .now()
          .microsecondsSinceEpoch
          .toString();
      String url = await _storageService.uploadPhoto(publisher, file);
      Product product;
      if (productType == ProductType.FOOD) {
        product = Product(
            _id, name, 'FOOD', explanation, publisher, geoPoint,url);
      } else if (productType == ProductType.CLOTHES) {
        product = Product(
            _id, name, 'CLOTHES', explanation, publisher, geoPoint,url);
      } else {
        return null;
      }
      if (product != null) {
        return await _firestoreService.saveProduct(product);
        /*if (result) {
          return true;
        } else {
          return false;
        }*/
      } else {
        return null;
      }
    } catch (e) {
      print('ProductModel-saveProduct Error: $e');
      return e;
    } finally {
      state = ProductViewState.Idle;
    }
  }

  @override
  Future<List<Product>> readAllProducts() async {
    try {
      state = ProductViewState.Busy;
      List<Product> _productList = await _firestoreService.readAllProducts();
      if (_productList != null) {
        productList = _productList;
        return productList;
      } else {
        return null;
      }
    } catch (e) {
      print('ProductModel-readAllProducts Error: $e');
      return e;
    } finally {
      state = ProductViewState.Idle;
    }
  }
  Future<String> getAdress(latitude,longitude) async {
    var coordinates =
    Coordinates(latitude,longitude);
    var _address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    if (_address != null) {
        address = _address.first.addressLine;
    }
    return address;
  }
}
