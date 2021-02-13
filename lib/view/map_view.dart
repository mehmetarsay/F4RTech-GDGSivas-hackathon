import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/models/product.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/product_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();
  Position currentPosition;
  CameraPosition _kGooglePlex;
  String address;
  List<Product> allPositions;
  Set<Marker> markers;
  double radius=500;
  UserModel userModel;

  @override
  void initState() {
    super.initState();
    markers=Set<Marker>();
    userModel=Provider.of<UserModel>(context,listen:false);
    currentPosition=userModel.currentLocation;
    _kGooglePlex = CameraPosition(
      target: LatLng(currentPosition.latitude, currentPosition.longitude),
      zoom: 15.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

              body: FutureBuilder(future: getMarkers(),builder:(context,snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: Constants.getHeight(context),
                    child: GoogleMap(
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      mapToolbarEnabled: false,
                      circles: Set.from([
                        Circle(
                          circleId: CircleId("1"),
                          center: LatLng(
                              currentPosition.latitude,
                              currentPosition.longitude),
                          radius: radius,
                          strokeColor: ColorTable.blue,
                          fillColor: Colors.blue.withOpacity(0.5),
                          strokeWidth: 5,
                        )
                      ]),
                      markers: snapshot.data,
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  );
                }
                else {
                  return Center(child:CircularProgressIndicator());
                }
              }));
  }

   /*Bu fonksiyon userModel'e taşınabilir*/

  /* Adresin Latitude ve longitude değerlerini kullanarak adresin String halini döndürür */
  Future<String> getAdress(latitude,longitude) async {
    var coordinates =
        Coordinates(latitude,longitude);
    var _address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    if (_address != null) {
      setState(() {
        address = _address.first.addressLine;
      });
    }
    return address;
  }

  Future<Set<Marker>> getMarkers() async{
    final productModel=Provider.of<ProductModel>(context,listen: false);
    allPositions=await productModel.readAllProducts();
    for(int i=0;i<allPositions.length;++i)
      {
        var latitude=allPositions[i].location.latitude;
        var longitude=allPositions[i].location.longitude;
        var currentLat=currentPosition.latitude;
        var currentLon=currentPosition.longitude;
        if(Geolocator.distanceBetween(latitude, longitude,currentLat, currentLon)<radius) {
          markers.add(Marker(markerId: MarkerId('$i'),
              position: LatLng(
                  latitude, longitude),onTap: (){
            return showModalBottomSheet(context: context, builder: (context){
              if(address!=null)
                {
                  address=null;
                }
              return FutureBuilder(future:getAdress(latitude, longitude),builder: (context,snapshot)
                {
                  if(snapshot.hasData)
                    return Center(child: Column(
                      children: [
                        Text(snapshot.data.toString()),
                        Text(allPositions[i].name),
                        Text(allPositions[i].productType),
                        Text(allPositions[i].explanation),
                        RaisedButton(child: Text('Teklif Ver'),onPressed: (){
                        },)
                      ],
                    ));
                  else
                    return Center(child:CircularProgressIndicator());
                },);
            },);
              }));
        }
      }
    return markers;
  }
}
