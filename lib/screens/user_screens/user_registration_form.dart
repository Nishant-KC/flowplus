import 'package:flow_plus/constants/form_constants.dart';
import 'package:flow_plus/constants/form_field_hint_constants.dart';
import 'package:flow_plus/data/models/user_details_model.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flow_plus/screens/user_screens/user_profile_page.dart';
import 'package:flow_plus/widgets/_common/custom_button.dart';
import 'package:flow_plus/widgets/_common/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/helpers/user_collection_helper.dart';

class UserRegistrationForm extends StatefulWidget {
  const UserRegistrationForm({Key? key}) : super(key: key);

  @override
  State<UserRegistrationForm> createState() => _UserRegistrationFormState();
}

class _UserRegistrationFormState extends State<UserRegistrationForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final ValueNotifier _isLoading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<UserDetailsModel?>(context);
    print('User Registration');
    print(userDetails);
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Registration"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                CustomFormField(
                  initialText: userDetails?.firstName ?? "",
                  name: UserInfoFormConstants.firstName,
                  hint: FormFieldHintsContants.firstName,
                  isRequired: true,
                ),
                CustomFormField(
                  name: UserInfoFormConstants.lastName,
                  hint: FormFieldHintsContants.lastName,
                  isRequired: true,
                ),
                CustomFormField(
                  name: UserInfoFormConstants.userNumber,
                  hint: FormFieldHintsContants.userNumber,
                  isRequired: true,
                ),
                CustomFormField(
                  name: UserInfoFormConstants.userAddress,
                  hint: FormFieldHintsContants.userAddress,
                  isRequired: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                // CustomButton(
                //   onPressed: () {},
                //   title: 'Add Payment Information',
                // ),
                ValueListenableBuilder(
                  valueListenable: _isLoading,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return CustomButton(
                      onPressed: _handleSaveForm,
                      title: 'Sign Up Now',
                      showLoader: value,
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void _handleSaveForm() async {
    if (_formKey.currentState!.validate()) {
      UserOrBusinessProvider userProvider =
          Provider.of<UserOrBusinessProvider>(context, listen: false);
      _formKey.currentState!.save();
      _isLoading.value = true;
      await UserCollectionHelper().addUserDetails(
        userID: userProvider.uid ?? "",
        userDetails: _formKey.currentState!.value,
      );
      _isLoading.value = false;

      Get.offAll(() => const UserProfilePage());
      Get.snackbar("Registration", "User Registered Successfully");
    }
  }
}
