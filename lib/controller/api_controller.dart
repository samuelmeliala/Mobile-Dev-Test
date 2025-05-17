import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_dev_test/model/user_model.dart';

class ApiController extends GetxController {
  var users = <UserModel>[].obs;
  var page = 1.obs;
  var isLoading = false.obs;
  var isMoreDataAvailable = true.obs;

  Future<void> fetchUsers({bool refresh = false}) async {
    if (isLoading.value || !isMoreDataAvailable.value) return;

    isLoading.value = true;

    if (refresh) {
      users.clear();
      page.value = 1;
      isMoreDataAvailable.value = true;
    }

    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=${page.value}&per_page=6'),
      headers: {'x-api-key': 'reqres-free-v1'},
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List<dynamic> data = body['data'];

      if (data.isEmpty) {
        isMoreDataAvailable.value = false;
      } else {
        users.addAll(data.map((e) => UserModel.fromJson(e)).toList());
        page.value++;
      }
    } else {
      isMoreDataAvailable.value = false;
    }

    isLoading.value = false;
  }
}
