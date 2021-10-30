import 'package:get/get.dart';

class CounterController extends GetxController {
  //every variable you want to track or change should be turned into an observable
  var counter = 0.obs; //the variable going to change in this class's method

//method to increment our counter observable
  void increment() {
    counter++;
  }
}
