import 'package:flow_plus/data/controllers/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginUserTypeSelctionRadio extends StatelessWidget {
  final loginController = Get.find<LoginPageController>();
  LoginUserTypeSelctionRadio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 50,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: const Text('User'),
                leading: Radio<TypeOfUser>(
                  value: TypeOfUser.user,
                  groupValue: loginController.typeOfUser.value,
                  onChanged: (TypeOfUser? value) {
                    loginController.updateTypeOfUser(value!);
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('Business'),
                leading: Radio<TypeOfUser>(
                  value: TypeOfUser.business,
                  groupValue: loginController.typeOfUser.value,
                  onChanged: (TypeOfUser? value) {
                    loginController.updateTypeOfUser(value!);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
