import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/AppBarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/request_widget.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreService.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/map_view.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/product_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/request_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class VolunteerRequestPage extends StatefulWidget {
  @override
  _VolunteerRequestPageState createState() => _VolunteerRequestPageState();
}

class _VolunteerRequestPageState extends State<VolunteerRequestPage> {
  ProductModel productModel;
  UserModel userModel;
  @override
  void initState() {
    super.initState();
    productModel=context.read<ProductModel>();
    userModel=context.read<UserModel>();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: SafeArea(
        child:FutureBuilder(future:productModel.readFilteredProducts(500),builder: (context,snapshot){
          if(snapshot.hasData)
            {
                return Column(
                  children: [
                    AppBarWidget('GÖNÜLLÜ', ColorTable.greenT[1],mapButton: true,mapOnButton: () async{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView(snapshot.data)));
                    },),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder:(context,index){
                          return  FutureBuilder(future: productModel.getAdress(snapshot.data[index].location.latitude, snapshot.data[index].location.longitude),
                            builder:(context,sp){
                              if(snapshot.hasData)
                                {
                                  return InkWell(
                                    onTap: ()async{
                                      final requestModel=Provider.of<RequestModel>(context,listen:false);
                                      var product=await productModel.readProduct(snapshot.data[index].id);
                                      var userModel=Provider.of<UserModel>(context,listen: false);
                                      var differentUser=await userModel.differentUserFunc(product.publisher);
                                      await requestModel.saveRequest(requestedProduct:product,requested:differentUser,requesting:userModel.user );
                                    },
                                    child: RequestWidget(volunteer: true,text: '${snapshot.data[index].name}',subText:
                                        '${sp.data}',),
                                  );
                                }
                              else {return CircularProgressIndicator();}
                            }
                          );},)),]
                         );
            }
          else {
            return Center(child: CircularProgressIndicator());
          }
        },)
      ),
    );
  }
}
