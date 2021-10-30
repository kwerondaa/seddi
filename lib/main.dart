import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seddi/constants/firebase.dart';
import 'package:seddi/controllers/appcontroller.dart';
import 'package:seddi/controllers/authcontroller.dart';
import 'package:seddi/controllers/productscontroller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initializing our firebase app
  await initialization.then((value) {
    //registering our controllers
    Get.put(AppController());
    Get.put(AuthController());
    Get.put(ProductsController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Seddi, African Recipes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        secondaryHeaderColor: Color(0xFFEEBB91),
        accentColor: Color(0xFFDBECF1),
        primaryColor: Color(0xFFB09868),
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
