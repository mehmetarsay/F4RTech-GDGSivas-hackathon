import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/enums.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/validators.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/accept_button.dart';
import 'package:f4rtech_gdgsivas_hackathon/common_widget/my_text_field.dart';
import 'package:f4rtech_gdgsivas_hackathon/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  final UserType userType; //false: gönüllü / true: hayırsever
  @override
  _SignUpPageState createState() => _SignUpPageState();

  SignUpPage(this.userType);
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullname;
  TextEditingController email;
  TextEditingController phoneNumber;
  TextEditingController institution;
  TextEditingController password;
  GlobalKey<FormState> formkey;

  @override
  void initState() {
    super.initState();
    fullname = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    institution = TextEditingController();
    password = TextEditingController();
    formkey = GlobalKey<FormState>();
  }

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
                        usageTips(index),
                      ],
                    );
                  },
                  itemCount: volunterTips.length,
                  pagination: new SwiperPagination(
                    alignment: Alignment(0, 0.8),
                    builder: new DotSwiperPaginationBuilder(
                      color: widget.userType == UserType.VOLUNTEER
                          ? ColorTable.greenT[2]
                          : ColorTable.blueT[2],
                      activeColor: widget.userType == UserType.VOLUNTEER
                          ? ColorTable.greenT[2]
                          : ColorTable.blueT[2],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: Constants.getHeightValue(context, 20),
                left: Constants.getWidthValue(context, 35),
                right: Constants.getWidthValue(context, 35),
                child: Container(
                  height: Constants.getHeightValue(context, 400),
                  width: Constants.getWidthValue(context, 304),
                  child: Form(
                    key: formkey,
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
                          validator: emailValidator,
                          label: 'Email',
                          controller: email,
                          userType: widget.userType,
                          boxShadow: false,
                        ),
                        MyTextField(
                          validator: phoneValidator,
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
                          validator: passwordValidator,
                          label: 'Şifre',
                          controller: password,
                          userType: widget.userType,
                          boxShadow: false,
                        ),
                        widget.userType == UserType.VOLUNTEER
                            ? AcceptButton('Kayıt Ol', ColorTable.green,
                                onTap: (){
                                  signUpOnTap(UserType.SHARER);
                                })
                            : AcceptButton(
                                'Kayıt Ol',
                                ColorTable.blue,
                                onTap: (){
                                  signUpOnTap(UserType.SHARER);
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signUpOnTap(UserType userType) async {
    try {
      if (formkey.currentState.validate()) {
        formkey.currentState.save();
        var user = await context
            .read<UserModel>()
            .createUserWithEmailAndPassword(
                userType: userType,
                email: email.text,
                password: password.text,
                fullName: fullname.text,
                phoneNumber: phoneNumber.text,
                companyOrInstitution: institution.text);
        if (user != null) {
          Navigator.pop(context);
        }
      }else {
        Fluttertoast.showToast(msg: 'Lütfen Tüm Alanları Doğru Doldurunuz', toastLength: Toast.LENGTH_LONG);
      }
    } catch (e) {}
  }

  Widget usageTips(int index) {
    return Container(
      height: Constants.getHeightValue(context, 63),
      width: Constants.getWidthValue(context, 343),
      child: Text(
        widget.userType == UserType.VOLUNTEER
            ? volunterTips[index]
            : hyrTips[index],
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

  List<String> hyrTips = [
    'Bir Hayırsever Olup Yoksullara Umut Olmaya Çok Yakınsınız.',
    'Hayırsever Olarak Oturduğunuz yerden Gönüllüler aracılığı ile ürünlerinizi paylaşabilirsiniz'
  ];
  List<String> volunterTips = [
    'Bir Gönüllü Olup Yoksullara Umut Olmaya Çok Yakınsınız.',
    'Gönüllü Olarak Hayırsever insanlardan aldığınız ürünleri ihtiyaç sahiplerine ulaştırabilirsiniz.'
  ];
}
