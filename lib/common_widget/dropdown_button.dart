import 'package:f4rtech_gdgsivas_hackathon/app/colors.dart';
import 'package:f4rtech_gdgsivas_hackathon/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
class DropdownButtonWidget extends StatefulWidget {
  List<String> list;
  String select;
  String textName;
  Function function;
  IconData iconData;
  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();

  DropdownButtonWidget({this.list, this.select, this.textName='Text',this.function,this.iconData});
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:6.0),
      child: Container(
        height: Constants.getHeightValue(context, 75),
        width: Constants.getWidthValue(context, 327),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              width: Constants.getWidthValue(context, 327),
              height: Constants.getHeightValue(context, 20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Ürün Tipi',
                style: TextStyle(
                  color: ColorTable.blueT[5],
                  fontSize:
                  Constants.getHeightValue(context, 14),
                ),
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(top:4.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        color: Colors.black.withOpacity(0.06),
                      )
                    ]
                ),
                height: Constants.getHeightValue(context, 45),
                width: Constants.getWidthValue(context, 327),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      expands: true,
                      isHovering: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:5.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text("Seçiniz",style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: Constants.getHeightValue(context, 14),
                              color: '333333'.toColor().withOpacity(0.2),
                            ),),
                            value: widget.select,
                            isDense: true,
                            onChanged: (newValue) {
                              this.widget.function(newValue);
                              setState(() {
                                this.widget.select = newValue;

                              });
                            },
                            items: widget.list.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                  style: TextStyle(
                                    fontSize: Constants.getHeightValue(context, 14),
                                    fontWeight: FontWeight.w400,
                                    color: '333333'.toColor().withOpacity(0.8),
                                  ),),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
