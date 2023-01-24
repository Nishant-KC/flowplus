import 'package:flow_plus/constants/form_constants.dart';
import 'package:flow_plus/constants/form_field_hint_constants.dart';
import 'package:flow_plus/data/helpers/business_collection_helper.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flow_plus/screens/business_screens/financial_details_form.dart';
import 'package:flow_plus/widgets/_common/custom_button.dart';
import 'package:flow_plus/widgets/_common/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../widgets/_common/dropdown.dart';

class BusinessRegistrationForm extends StatefulWidget {
  const BusinessRegistrationForm({Key? key}) : super(key: key);

  @override
  State<BusinessRegistrationForm> createState() =>
      _BusinessRegistrationFormState();
}

class _BusinessRegistrationFormState extends State<BusinessRegistrationForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final ValueNotifier _isLoading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    UserOrBusinessProvider userOrBusiness =
        Provider.of<UserOrBusinessProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Business Registration"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                CustomFormField(
                  initialText:
                      userOrBusiness.businessDetails?.businessName ?? "",
                  name: BusinessInfoFormConstants.businessName,
                  hint: FormFieldHintsContants.businessName,
                  isRequired: true,
                ),
                CustomFormField(
                  initialText:
                      userOrBusiness.businessDetails?.businessAddress ?? "",
                  name: BusinessInfoFormConstants.businessAddress,
                  hint: FormFieldHintsContants.businessAddress,
                  isRequired: true,
                ),
                CustomFormField(
                  initialText:
                      userOrBusiness.businessDetails?.businessNumber ?? "",
                  name: BusinessInfoFormConstants.businessNumber,
                  hint: FormFieldHintsContants.businessNumber,
                  isRequired: true,
                ),
                CustomFormField(
                  initialText:
                      userOrBusiness.businessDetails?.businessType ?? "",
                  name: BusinessInfoFormConstants.businessType,
                  hint: FormFieldHintsContants.businessType,
                  isRequired: true,
                ),
                const DropdownButtonExample(),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: _handleSaveForm,
                  title: 'Register Now',
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
      await BusinessCollectionHelper().addBusinessDetails(
          userID: userProvider.uid ?? "",
          businessDetails: _formKey.currentState!.value);
      Get.to(() => const FinancialDetailsForm());
    }
  }
}
