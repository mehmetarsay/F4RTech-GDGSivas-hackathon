import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/accept_button.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/my_text_field.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  bool userType; //false: gönüllü / true: hayırsever
  @override
  _SignUpPageState createState() => _SignUpPageState();

  SignUpPage(this.userType);
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController institution = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: Constants.getHeight(context),
          width: Constants.getWidth(context),
          child: Stack(
            children: [
              Container(
                height: Constants.getHeightValue(context, 190),
                width: Constants.getWidth(context),
                child: Swiper(
                  autoplayDisableOnInteraction: false,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UsageTips( index),
                      ],
                    );
                  },
                  itemCount: volunterTips.length,
                  pagination: new SwiperPagination(
                    alignment: Alignment(0, 0.8),
                    builder: new DotSwiperPaginationBuilder(
                      color: widget.userType == false ? ColorTable.blueT[5]:ColorTable.greenT[5],
                      activeColor: widget.userType == false ?ColorTable.blueT[0]:ColorTable.greenT[0],

                    ),
                  ),
                  /* pagination: new SwiperPagination(
                      builder: SwiperPagination.dots,
                      alignment: Alignment(0,0.7),
                    ),*/
                ),
              ),
              Positioned(
                bottom: Constants.getHeightValue(context, 20),
                left: Constants.getWidthValue(context, 35),
                right: Constants.getWidthValue(context, 35),
                child: Container(
                  height: Constants.getHeightValue(context, 400),
                  width: Constants.getWidthValue(context, 304),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyTextField(
                        label: 'İsim-Soyisim',
                        controller: fullname,
                        userType: widget.userType,
                        boxShadow: false,
                      ),
                      MyTextField(
                        label: 'Email',
                        controller: email,
                        userType: widget.userType,
                        boxShadow: false,
                      ),
                      MyTextField(
                        label: 'Telefon Numarası',
                        controller: phoneNumber,
                        userType: widget.userType,
                        textInputType: TextInputType.number,
                        boxShadow: false,
                      ),
                      MyTextField(
                        label: 'Bağlı Kurum*',
                        controller: institution,
                        userType: widget.userType,
                        boxShadow: false,
                      ),
                      MyTextField(
                        label: 'Şifre',
                        controller: password,
                        userType: widget.userType,
                        boxShadow: false,
                      ),
                      widget.userType == false
                          ? AcceptButton(
                              'Kayıt Ol',
                              ColorTable.blue,
                              onTap: () async {
                                print('AAA');
                                final _userModel = Provider.of<UserModel>(
                                    context,
                                    listen: false);
                                try {
                                  var user = await _userModel
                                      .createUserWithEmailAndPassword(
                                          userType: UserType.VOLUNTEER,
                                          email: email.text,
                                          password: password.text,
                                          fullName: fullname.text,
                                          phoneNumber: phoneNumber.text,
                                          companyOrInstitution:
                                              institution.text);
                                  if(user != null){
                                    Navigator.pop(context);
                                  }
                                } catch (e) {}
                              },
                            )
                          : AcceptButton(
                              'Kayıt Ol',
                              ColorTable.green,
                              onTap: () async {
                                print('AAA');
                                final _userModel =
                                    Provider.of<UserModel>(context, listen: false);
                                try {
                                  var user = await _userModel
                                      .createUserWithEmailAndPassword(
                                          userType: UserType.SHARER,
                                          email: email.text,
                                          password: password.text,
                                          fullName: fullname.text,
                                          phoneNumber: phoneNumber.text,
                                          companyOrInstitution:
                                              institution.text);
                                  if(user != null){
                                    Navigator.pop(context);
                                  }
                                } catch (e) {}
                              },
                            ),
                      /*RaisedButton(
                        onPressed: () async {
                          print('AAA');
                          final _userModel =
                              Provider.of<UserModel>(context, listen: false);
                          try {
                            await _userModel.createUserWithEmailAndPassword(
                                userType: UserType.VOLUNTEER,
                                email: email.text,
                                password: password.text,
                                fullName: fullname.text,
                                phoneNumber: phoneNumber.text,
                                companyOrInstitution: institution.text);
                          } catch (e) {}
                        },
                        child: Text('Save'),
                      )*/
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget UsageTips(int index) {
    return Container(
      height: Constants.getHeightValue(context, 63),
      width: Constants.getWidthValue(context, 343),
      child: Text(
        widget.userType == true ? volunterTips[index]:hyrTips[index],
        maxLines: 3,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.25,
            color: Colors.black,
            fontSize: Constants.getHeightValue(context, 15)),
      ),
    );
  }
  List<String> hyrTips = ['Bir Hayırsever Olup Yoksullara Umut Olmaya Çok Yakınsınız.',
    'Hayırsever Olarak Oturduğunuz yerden Gönüllüler aracılığı ile ürünlerinizi paylaşabilirsiniz'];
  List<String> volunterTips = ['Bir Gönüllü Olup Yoksullara Umut Olmaya Çok Yakınsınız.',
    'Gönüllü Olarak Hayırsever insanlardan aldığınız ürünleri ihtiyaç sahiplerine ulaştırabilirsiniz.'];
}
