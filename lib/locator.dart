import 'package:f4rtech_gdgsivas_hackathon/services/AuthService.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/FirestoreService.dart';
import 'package:f4rtech_gdgsivas_hackathon/services/StorageService.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setupLocator(){
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => StorageService());
}