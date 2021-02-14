import 'dart:async';

import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
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
        return Column(
            children: [
              Container(
                height:Constants.getHeight(context)/2,
              child:GoogleMap(myLocationButtonEnabled: true,
                mapToolbarEnabled: false,mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },onTap: (latLng){
                  setState(() {
                    currentPosition=Position(latitude: latLng.latitude,longitude:latLng.longitude);
                    final userModel=Provider.of<UserModel>(context,listen:false);
                    userModel.currentLocation=currentPosition;
                    markers.add(Marker(markerId: MarkerId('1'),position: LatLng(currentPosition.latitude,currentPosition.longitude)));
                    print(markers.toString());
                  });
                },markers:markers,
              ),
              ),
              Center(
                child: RaisedButton(child:Text('Tamamlandı'),onPressed: (){
                  Navigator.pop(context);
                },),
              )
            ],
          );
      }
  }
