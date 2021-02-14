
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/progressbarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/SelectLocation.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/volunteer_request_page.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Denemepage extends StatefulWidget {
  @override
  _DenemepageState createState() => _DenemepageState();
}

class _DenemepageState extends State<Denemepage> {
  @override
  Widget build(BuildContext context) {
    final _productModel = Provider.of<ProductModel>(context);
    if (_productModel.state == ProductViewState.Idle) {
      if (_productModel.productList.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Deneme'),
            actions: [
              RaisedButton(
                child: Text('Kaydet'),
                onPressed: () async {
                  try {
                    var result = await _productModel.readAllProducts();
                    if (result != null) {
                      _productModel.productList.forEach((element) {
                        print(element);
                      });
                    }
                  } catch (e) {
                    print('ERROR: $e');
                  }
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Center(
                child: RaisedButton(child:Text('Volunteer Request'),onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>VolunteerRequestPage()));
                },),

              ),
              RaisedButton(child:Text('SelectMap git'),onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>SelectLocation()));
              },),
            ],
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('Deneme'),
            actions: [
              /*RaisedButton(
                child: Text('Kaydet'),
                onPressed: () async {
                  final _userModel = Provider.of<UserModel>(context, listen: false);
                  try {
                    //var result = await _productModel.readFilteredProducts(GeoPoint(34, 34));
                    if (result != null) {
                      _productModel.productList.forEach((element) {
                        print(element);
                      });
                    }
                    var result2 = await _productModel.saveProduct(
                  name: 'pilav',
                  productType: ProductType.FOOD,
                  explanation:
                      'Fazla pilay kaldı çöpe gitmeden ihtiyaç sahibi alsın',
                  publisher: _userModel.user.uid);
                  } catch (e) {
                    print('ERROR: $e');
                  }
                },
              ), */
            ],
          ),
          body: ListView.builder(
            itemCount: _productModel.productList.length,
            itemBuilder: (context, index) {
              Product product = _productModel.productList[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text(product.explanation),
              );
            },
          ),
        );
      }
    } else {
      return Scaffold(
        body: Center(
          child: ProgressBar(),
        ),
      );
    }
  }
}
