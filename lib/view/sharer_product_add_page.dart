import 'dart:io';
import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/AppBarWidget.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/TextWidget1.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/accept_button.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/my_text_field.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/product_model.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

class ProductAddPage extends StatefulWidget {
  @override
  _ProductAddPageState createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController text = TextEditingController();
  List<Asset> images = <Asset>[];
  File imageFile;

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    final _productModel = Provider.of<ProductModel>(context);
    //if (_productModel.state == ProductViewState.Idle) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0, child: AppBarWidget('HAYIRSEVER', ColorTable.blueT[1])),
            Positioned(
              left: Constants.getWidthValue(context, 30),
              right: Constants.getWidthValue(context, 30),
              top: Constants.getHeightValue(context, 60),
              child: TextWidget('Ürün Ekle'),
            ),
            Positioned(
              top: Constants.getHeightValue(context, 100),
              bottom: 0,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  height: Constants.getHeightValue(context, 500),
                  width: Constants.getWidth(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: Constants.getHeightValue(context, 206),
                        width: Constants.getWidthValue(context, 327),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: '#F2F2F2'.toColor(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: Constants.getWidthValue(context, 200),
                                  height:
                                      Constants.getHeightValue(context, 176),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white),
                                  child: images.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: AssetThumb(
                                            asset: images.first,
                                            width: 200,
                                            height: 200,
                                          ),
                                        )
                                      : SizedBox(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      images.clear();
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                    child: Icon(
                                      Icons.close,
                                      color: '#BE0000'.toColor(),
                                      size:
                                          Constants.getWidthValue(context, 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: Constants.getHeightValue(context, 176),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    splashColor: Colors.red,
                                    onTap: () {
                                      _imgFromGallery();
                                    },
                                    child: GetCamera(
                                        'Fotoğraf Çek', Icons.camera_alt),
                                  ),
                                  InkWell(
                                    splashColor: Colors.red,
                                    onTap: () {
                                      loadAssets();
                                    },
                                    child:
                                        GetCamera('Fotoğraf Seç', Icons.photo),
                                  ),
                                  Container(
                                    height:
                                        Constants.getHeightValue(context, 56),
                                    width: Constants.getWidthValue(context, 96),
                                    child:
                                        Text('Ürün Eklerken Dikkat Ediniz!!!'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: Constants.getHeightValue(context, 77),
                          width: Constants.getWidthValue(context, 327),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ürün Adı',
                                style: TextStyle(
                                  color: ColorTable.blueT[5],
                                  fontSize:
                                  Constants.getHeightValue(context, 14),
                                ),
                              ),
                              TextFormField(
                                controller: controller,
                                keyboardType: TextInputType.multiline,
                                maxLines: 1,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: Constants.getHeightValue(context, 150),
                          width: Constants.getWidthValue(context, 327),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ürün Açıklaması',
                                style: TextStyle(
                                  color: ColorTable.blueT[5],
                                  fontSize:
                                      Constants.getHeightValue(context, 14),
                                ),
                              ),
                              TextFormField(
                                controller: text,
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                maxLength: 70,
                                decoration: InputDecoration(
                                  border: InputBorder.none
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      AcceptButton(
                        'Gönder',
                        ColorTable.blue,
                        onTap: () async {
                          try {
                            await _productModel.saveProduct(
                                name: 'Corba',
                                productType: ProductType.FOOD,
                                explanation: controller.text,
                                publisher: _userModel.user.uid,
                                file: images.first);
                          } catch (e) {
                            print('ERROR: $e');
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    /*} else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }*/
  }

  GetCamera(String text, IconData iconData) {
    return Container(
      height: Constants.getHeightValue(context, 48),
      width: Constants.getWidthValue(context, 96),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: '#E2E2E2'.toColor(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            iconData,
            color: '#979797'.toColor(),
            size: Constants.getHeightValue(context, 20),
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: Constants.getHeightValue(context, 9)),
          )
        ],
      ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Dectected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: 'Student Detail'),
        materialOptions: MaterialOptions(
          actionBarColor: '#abcdef',
          actionBarTitle: 'F4RTech GDGSivas Hackathon ',
          allViewTitle: 'Tüm Fotoğraflar',
          useDetailsView: false,
          selectCircleStrokeColor: '#000000',
        ),
      );
    } on Exception catch (e) {
      error = 'loadAsset Error $e';
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  Future _imgFromGallery() async {
    final picker = ImagePicker();

    PickedFile pickedFile = await picker.getImage(
        preferredCameraDevice: CameraDevice.front, source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        /*Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddPhotoPage(imageFile)));*/
        //_uploadImageToFirebase(imageFile);
        //_image = imageFile;
        //addUser(_image);
      } else {
        print('No image selected.');
      }
    });
  }
}
