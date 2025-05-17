import 'package:get/get.dart';

class PalindromeController extends GetxController {
  var name = ''.obs;
  var palindromeText = ''.obs;
  var isPalindrome = false.obs;

  void checkPalindrome() {
    String original = palindromeText.value.toLowerCase().replaceAll(' ', '');
    String reversed = original.split('').reversed.join('');
    isPalindrome.value = original == reversed;
  }
}
