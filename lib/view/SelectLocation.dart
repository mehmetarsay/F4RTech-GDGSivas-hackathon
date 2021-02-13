import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/product_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  Position currentPosition;
  var  _kGooglePlex = CameraPosition(
    target: LatLng(40.9950369, 29.0638701),
    zoom: 5.4746,
  );
  Set<Marker> markers;
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    final userModel=Provider.of<UserModel>(context,listen:false);
    currentPosition=userModel.currentLocation;
    markers={Marker(markerId: MarkerId('1'),position: LatLng(currentPosition.latitude,currentPosition.longitude))};

  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                height:250,
              child:GoogleMap(myLocationButtonEnabled: true,
                mapToolbarEnabled: false,mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },onTap: (latLng){
                  setState(() {
                    currentPosition=Position(latitude: latLng.latitude,longitude:latLng.longitude);
                    final userModel=Provider.of<UserModel>(context,listen:false);
                    markers.add(Marker(markerId: MarkerId('1'),position: LatLng(currentPosition.latitude,currentPosition.longitude)));
                    print(markers.toString());
                  });
                },markers:markers,
              ),
              ),
              Text(currentPosition.toString()),
              RaisedButton(child: Text('Ürünü yolla'),onPressed: (){
                final productModel=Provider.of<ProductModel>(context,listen:false);
                final userModel=Provider.of<UserModel>(context,listen:false);
                productModel.saveProduct(name:'Yemek',productType: ProductType.FOOD,explanation: 'Deneme',publisher:userModel.user.uid ,geoPoint: GeoPoint(currentPosition.latitude,currentPosition.longitude));
              })
            ],
          ),
        );
      }
  }
