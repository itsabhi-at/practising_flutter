// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  loginWithEmail(email, password) {
    try {
      isLoading.value = true;
      loginService(email, password);
    } catch (e) {
      if (kDebugMode) {
        print('error:$e');
      }
    } finally {
      isLoading.value = false;
    }
  }
}

void loginService(email, password) async {
  var response =
      await http.post(Uri.parse('https://reqres.in/api/login'), body: {
    'email': email,
    'password': password,
  });
  if (response.statusCode == 200) {
    return print('working');
  } else {
    return print('invalid');
  }
}
