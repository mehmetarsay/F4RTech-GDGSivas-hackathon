import 'dart:io';
import 'package:f4rtech_gdgsivas_hackathon/services/StorageBase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


class StorageService implements StorageBase {
  @override
  Future<String> uploadPhoto(String uid, Asset file) async {
    try {
      SettableMetadata metadata = SettableMetadata(
          customMetadata: <String, String>{
            'uid' : uid,
          });
      Reference reference = FirebaseStorage.instance.ref().child('images').child(uid);
      var uploadTask = await reference.putData((await file.getByteData()).buffer.asUint8List(),metadata);
      TaskState result = uploadTask.state;
      if(result == TaskState.success){
        String url = await uploadTask.ref.getDownloadURL();
        if(url != null){
          return url;
        }else {
          return null;
        }
      }else {
        return null;
      }
    } catch (e) {
      print('StorageService-uploadPhoto Error: $e');
      return e;
    }
  }

}