import 'package:get/get.dart';
import 'package:seddi/constants/firebase.dart';
import 'package:seddi/models/product_model.dart';
import 'dart:async';

class ProductsController extends GetxController {
  static ProductsController instance =
      Get.find(); //creating an instance of Get.find. it returns the controller

  //defining a list of products to be displayed on the app. they are observable so that
  //when anything changes in the databse, it reflects on the app
  RxList<ProductModel> products = RxList<ProductModel>([]);

  //name of collection we are going to access on the database
  String collection = 'products';

  //This populates the products as soon as we open the app
  @override
  void onReady() {
    super.onReady();

    //binding the products into a stream
    products.bindStream(getAllProducts());
  }

  // Future<Stream<List<ProductModel>>> getAllProducts() async {
  //   await firebaseFirestore.collection(collection).snapshots().map((query) =>
  //       query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
  // }

  Stream<List<ProductModel>> getAllProducts() async* {
    await firebaseFirestore.collection(collection).snapshots().map((query) =>
        query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
  }
}
