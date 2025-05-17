import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PalindromeController extends GetxController {
  var name = ''.obs;
  var palindromeText = ''.obs;
  var isPalindrome = false.obs;

  void checkPalindrome() {
    String original = palindromeText.value.toLowerCase().replaceAll(' ', '');
    String reversed = original.split('').reversed.join('');
    isPalindrome.value = original == reversed;
  }

  void handleCheckButton(BuildContext context) {
    if (palindromeText.value.isEmpty) {
      // Show dialog if the text field is empty
      Get.defaultDialog(
        title: "Error",
        middleText: "The field should not be empty.",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back(); // Close the dialog
        },
      );
    } else {
      // Perform palindrome check and show result dialog
      checkPalindrome();
      Get.defaultDialog(
        title: "Palindrome Check",
        middleText:
            isPalindrome.value ? "✅ It's a palindrome!" : "❌ Not a palindrome",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back(); // Close the dialog
        },
      );
    }
  }
}
