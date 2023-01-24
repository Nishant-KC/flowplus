import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

enum TypeOfUser { user, business }

class LoginPageController extends GetxController {
  final typeOfUser = TypeOfUser.user.obs;
  final formKey = GlobalKey<FormBuilderState>();
  final isLoading = false.obs;

  updateTypeOfUser(TypeOfUser user) {
    typeOfUser(user);
  }

  updateLoading(bool loading) {
    isLoading(loading);
  }
  
}
