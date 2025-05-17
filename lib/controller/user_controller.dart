import 'package:get/get.dart';
class UserController extends GetxController {
  var name = ''.obs;
  var selectedUser = ''.obs;

  void setSelectedUser(String user) {
    selectedUser.value = user;
  }
}
