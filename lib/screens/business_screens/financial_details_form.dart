import 'package:flow_plus/constants/form_constants.dart';
import 'package:flow_plus/constants/form_field_hint_constants.dart';
import 'package:flow_plus/data/helpers/business_collection_helper.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flow_plus/screens/business_screens/business_profile_page.dart';
import 'package:flow_plus/widgets/_common/custom_button.dart';
import 'package:flow_plus/widgets/_common/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FinancialDetailsForm extends StatefulWidget {
  const FinancialDetailsForm({Key? key}) : super(key: key);

  @override
  _FinancialDetailsFormState createState() => _FinancialDetailsFormState();
}

class _FinancialDetailsFormState extends State<FinancialDetailsForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    UserOrBusinessProvider userOrBusiness =
        Provider.of<UserOrBusinessProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Financial Details"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  CustomFormField(
                    name: BusinessFinancialsFormConstants.monthlyEarnings,
                    hint: FormFieldHintsContants.monthlyEarnings,
                    isRequired: true,
                    isNumeric: true,
                    initialText: userOrBusiness
                            .businessFinanceDetails?.monthlyEarnings ??
                        "",
                  ),
                  CustomFormField(
                    name: BusinessFinancialsFormConstants.costPerUnit,
                    hint: FormFieldHintsContants.costPerUnit,
                    isRequired: true,
                    isNumeric: true,
                    initialText:
                        userOrBusiness.businessFinanceDetails?.costPerUnit ??
                            "",
                  ),
                  CustomFormField(
                    name: BusinessFinancialsFormConstants.grossProfitMargin,
                    hint: FormFieldHintsContants.grossProfitMargin,
                    isRequired: true,
                    isNumeric: true,
                    initialText: userOrBusiness
                            .businessFinanceDetails?.grossProfitMargin ??
                        "",
                  ),
                  CustomFormField(
                    name: BusinessFinancialsFormConstants.monthlyPayroll,
                    hint: FormFieldHintsContants.monthlyPayroll,
                    isRequired: true,
                    isNumeric: true,
                    initialText:
                        userOrBusiness.businessFinanceDetails?.monthlyPayroll ??
                            "",
                  ),
                  CustomFormField(
                    name: BusinessFinancialsFormConstants.inventoryServiceCost,
                    hint: FormFieldHintsContants.inventoryServiceCost,
                    isRequired: true,
                    isNumeric: true,
                    initialText: userOrBusiness
                            .businessFinanceDetails?.inventoryServiceCost ??
                        "",
                  ),
                  CustomFormField(
                    name: BusinessFinancialsFormConstants.operatingExpenses,
                    hint: FormFieldHintsContants.operatingExpenses,
                    isRequired: true,
                    isNumeric: true,
                    initialText: userOrBusiness
                            .businessFinanceDetails?.operatingExpenses ??
                        "",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text((userOrBusiness.businessFinanceDetails
                              ?.monthlyEarningsMinusPayroll() ??
                          "")
                      .toString()),
                  Text((userOrBusiness.businessFinanceDetails?.burnRate() ?? "")
                      .toString()),
                  // Text((userOrBusiness.businessFinanceDetails
                  //     ?.breakEvenPointMonth() ??
                  //     "")
                  //     .toString()),
                  CustomButton(
                    onPressed: _handleSaveForm,
                    title: 'Save Details',
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _handleSaveForm() async {
    if (_formKey.currentState!.validate()) {
      UserOrBusinessProvider userProvider =
          Provider.of<UserOrBusinessProvider>(context, listen: false);
      _formKey.currentState!.save();
      await BusinessCollectionHelper().addFinanceDetails(
        userID: userProvider.uid ?? "",
        financeDetails: _formKey.currentState!.value,
      );
      userProvider.refreshFinancialDetails();
      Get.to(() => const BusinessProfilePage());
    }
  }
}
