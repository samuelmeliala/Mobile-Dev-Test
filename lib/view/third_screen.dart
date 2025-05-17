import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_test/controller/user_controller.dart';
import 'package:mobile_dev_test/controller/api_controller.dart';

class ThirdScreen extends StatelessWidget {
  final ApiController apiController = Get.put(ApiController());
  final UserController userController = Get.find<UserController>();

  ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    apiController.fetchUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Obx(() {
        if (apiController.users.isEmpty && apiController.isLoading.isFalse) {
          return const Center(child: Text("No users found"));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                apiController.isMoreDataAvailable.value) {
              apiController.fetchUsers();
            }
            return true;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              await apiController.fetchUsers(refresh: true);
            },
            child: ListView.separated(
              itemCount: apiController.users.length,
              separatorBuilder: (_, __) => Divider(height: 1),
              itemBuilder: (context, index) {
                final user = apiController.users[index];
                return ListTile(
                  onTap: () {
                    userController.setSelectedUser(
                      "${user.firstName} ${user.lastName}",
                    );
                    Get.back();
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text(
                    "${user.firstName} ${user.lastName}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(user.email.toUpperCase()),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
