import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_test/controller/palindrome_controller.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final PalindromeController controller = Get.put(PalindromeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person_add, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 32),
                TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onChanged: (value) => controller.name.value = value,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Palindrome",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onChanged: (value) => controller.palindromeText.value = value,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (controller.palindromeText.value.isEmpty) {
                      // Show dialog if the text field is empty
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content: const Text(
                              "The field should not be empty.",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pop(); // Close the dialog
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Perform palindrome check and show result dialog
                      controller.checkPalindrome();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Palindrome Check"),
                            content: Text(
                              controller.isPalindrome.value
                                  ? "✅ It's a palindrome!"
                                  : "❌ Not a palindrome",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pop(); // Close the dialog
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B637B),
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  child: const Text("CHECK"),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/nextScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B637B),
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  child: const Text("NEXT"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
