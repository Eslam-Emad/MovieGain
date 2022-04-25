import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:movie_gain/core/service_locator.dart';
import '../data/datasources/remote/push_notification_remote.dart';
import '../main.dart';
import 'networking/dio_client.dart';

class InitializeApp {
  static Future run() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setup();
    DioClient.instanceDio();
    await Firebase.initializeApp();
    await PushNotificationRemoteDatasource().init();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    ).then((value) => runApp(const MyApp()));
  }
}
