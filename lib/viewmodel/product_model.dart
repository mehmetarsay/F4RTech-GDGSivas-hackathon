import 'package:cloud_firestore_platform_interface/src/geo_point.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/AuthService.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/ProductBase.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/locator.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreService.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier implements ProductBase {
  ProductViewState _state = ProductViewState.Idle;
  FirestoreService _firestoreService = locator<FirestoreService>();
  AuthService _authService = locator<AuthService>();
  Product _product;
  List<Product> _productList;

  ProductModel() {
    _productList = [];
  }

  ProductViewState get state => _state;

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
  Future<bool> saveProduct({String name,
    ProductType productType,
    String explanation,
    String publisher}) async {
    try {
      state = ProductViewState.Busy;
      String _id = DateTime
          .now()
          .microsecondsSinceEpoch
          .toString();
      Product product;
      if (productType == ProductType.FOOD) {
        product = Product(
            _id, name, 'FOOD', explanation, publisher, GeoPoint(34, 34));
      } else if (productType == ProductType.CLOTHES) {
        product = Product(
            _id, name, 'CLOTHES', explanation, publisher, GeoPoint(34, 34));
      } else {
        return null;
      }
      if (product != null) {
        var result = await _firestoreService.saveProduct(product);
        if (result) {
          return true;
        } else {
          return false;
        }
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

  @override
  Future<List<Product>> readFilteredProducts(GeoPoint location) async{
    try {
      state = ProductViewState.Busy;
      List<Product> _productList = await _firestoreService.readFilteredProducts(location);
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



}
