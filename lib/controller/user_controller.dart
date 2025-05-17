import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev_test/view/second_screen.dart';

class UserController extends GetxController {
  var name = ''.obs;
  var selectedUser = ''.obs;

  void setSelectedUser(String user) {
    selectedUser.value = user;
  }

  void handleNextButton(BuildContext context) {
    if (name.value.isEmpty) {
      // Show dialog if the name field is empty
      Get.defaultDialog(
        title: "Error",
        middleText: "Please enter your name.",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
    } else {
      // Navigate to the SecondScreen if the name is not empty
      Get.to(() => SecondScreen(name: name.value));
    }
  }
}
