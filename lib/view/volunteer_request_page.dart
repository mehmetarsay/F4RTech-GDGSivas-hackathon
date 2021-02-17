import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/AppBarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/progressbarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/request_widget.dart';
import 'package:f4rtech_gdgsivas_hackathon/view/map_view.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/product_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/request_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    productModel = context.read<ProductModel>();
    userModel = context.read<UserModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: FutureBuilder(
        future: productModel.readFilteredProducts(500),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              AppBarWidget(
                'GÖNÜLLÜ',
                ColorTable.greenT[1],
                mapButton: true,
                mapOnButton: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapView(snapshot.data)));
                },
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: snapshot.data.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FutureBuilder(
                      future: productModel.getAdress(
                          snapshot.data[index].location.latitude,
                          snapshot.data[index].location.longitude),
                      builder: (context, sp) {
                        if (snapshot.hasData) {
                          return InkWell(
                            child: RequestWidget(
                              onTap: () async {
                                Fluttertoast.showToast(
                                    msg: 'Talep Gönderiliyor',
                                    toastLength: Toast.LENGTH_LONG);
                                final requestModel = Provider.of<RequestModel>(
                                    context,
                                    listen: false);

                                var product = await productModel
                                    .readProduct(snapshot.data[index].id);
                                var differentUser = await userModel
                                    .differentUserFunc(product.publisher);
                                bool result = await requestModel.saveRequest(
                                    requestedProduct: product,
                                    requested: differentUser,
                                    requesting: userModel.user);
                                if (result) {
                                  Fluttertoast.showToast(
                                      msg:
                                          'Talep Başarıyla gönderilmiştir, profil sayfanızdan talep durumunu görüntüleyebilirsiniz',
                                      toastLength: Toast.LENGTH_LONG);
                                }else {
                                  Fluttertoast.showToast(msg: 'Hata', toastLength: Toast.LENGTH_LONG);
                                }
                              },
                              volunteer: true,
                              text: '${snapshot.data[index].name}',
                              subText: '${sp.data}',
                              photo: snapshot.data[index].imageUrl,
                            ),
                          );
                        } else {
                          return ProgressBar();
                        }
                      });
                },
              )),
            ]);
          } else {
            return ProgressBar();
          }
        },
      )),
    );
  }
}
