import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_test/controller/palindrome_controller.dart';
import 'package:mobile_dev_test/controller/user_controller.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  final PalindromeController controller = Get.put(PalindromeController());
  final UserController userController = Get.put(UserController());

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
                  radius: 80,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person_add, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 80),
                TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onChanged: (value) => userController.name.value = value,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Palindrome",
                    hintStyle: TextStyle(color: Colors.black38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onChanged: (value) => controller.palindromeText.value = value,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    controller.handleCheckButton(
                      context,
                    ); // Call the controller method
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
                    userController.handleNextButton(
                      context,
                    ); // Call the method from UserController
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
