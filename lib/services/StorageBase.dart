import 'package:multi_image_picker/multi_image_picker.dart';

abstract class StorageBase {
  Future<String> uploadPhoto(String uid, Asset file);
}