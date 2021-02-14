import 'package:flutter/material.dart';
class ShowDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Container(
          height: 30,
          child: AlertDialog(
            title: new Text("Hata",style: TextStyle(
                color: Colors.red
            ),),
            content: new Text("Lütfen Seçimleri Tamamlayınız."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Tamam",style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700
                ),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
