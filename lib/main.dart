import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:mollet/registration/splash_screen.dart';
import 'package:mollet/test.dart';
import 'package:path_provider/path_provider.dart';
import 'bottom/bottom_screen.dart';
import 'bottom/home_screen.dart';
import 'bottom/statement_screen.dart';
import 'home.dart';
import 'others/payment_scan_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mollet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), 
      home: SplashScreen(),
    );
  }
}
