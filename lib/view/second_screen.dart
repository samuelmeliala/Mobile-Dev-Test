import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_test/controller/user_controller.dart';
import 'package:mobile_dev_test/view/third_screen.dart';

class SecondScreen extends StatelessWidget {
  final String name;
  final UserController userController = Get.put(UserController());

  SecondScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome", style: TextStyle(fontSize: 16)),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Center(
                child: Obx(
                  () => Text(
                    userController.selectedUser.isEmpty
                        ? "Selected User Name"
                        : userController.selectedUser.value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => ThirdScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B637B),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Choose a User"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
