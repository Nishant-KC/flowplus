import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../constants/form_constants.dart';
import '../../constants/form_field_hint_constants.dart';
import '../../data/helpers/user_collection_helper.dart';
import '../../data/providers/user_or_business_provider.dart';
import '../../widgets/_common/custom_form_field.dart';
import 'my_vouchers_page.dart';

class RedeemVoucherPage extends StatelessWidget {
  const RedeemVoucherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RedeemVoucherWidget extends StatefulWidget {
  const RedeemVoucherWidget({Key? key}) : super(key: key);

  @override
  _RedeemVoucherWidgetState createState() => _RedeemVoucherWidgetState();
}

class _RedeemVoucherWidgetState extends State<RedeemVoucherWidget> {

  final pureNumbers = RegExp(r'^[0-9]+$');

  int numberValue = 200;
  late int latestNumberValue;
  final _formKey = GlobalKey<FormBuilderState>();
  //final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserOrBusinessProvider userOrBusiness =
    Provider.of<UserOrBusinessProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        // child: Center(
        //   child: Card(
        //     child: Padding(
        //       padding: const EdgeInsets.all(5.0),
        //       child: Column(
        //         children: <Widget>[
        //           /**
        //            * Below is the Text() field where subtraction math should occure.
        //            */
        //           /// The value in the Text() widget should be subtracted automatically with
        //           /// the number values inside the TextFormField() widget automatically as the user is typing the numbers
        //           Text(
        //             'Number value text: ${this.numberValue}',
        //             style: const TextStyle(
        //               fontSize: 20,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //           const SizedBox(
        //             height: 6,
        //           ),
        //           Form(
        //             key: formKey,
        //             child: Column(
        //               children: <Widget>[
        //                 TextFormField(
        //                   keyboardType: TextInputType.number,
        //                   decoration: const InputDecoration(
        //                     labelText: 'Reduce number value?',
        //                     hintText: 'Default number value is "0"',
        //                   ),
        //                   validator: (val) {
        //                     if (val?.isEmpty == true) {
        //                       return 'Fill in number values';
        //                     }
        //                     if (pureNumbers.hasMatch(val!) == false) {
        //                       return 'Use alphanumeric characters only in nickname';
        //                     }
        //                     return null;
        //                   },
        //                   onSaved: (val) => this.latestNumberValue = int.parse(val!),
        //                   onChanged: (val) {
        //                     if (val.isEmpty) {
        //                       setState(() => numberValue = 200);
        //                     } else {
        //                       numberValue = 200;
        //                       setState(() => numberValue -= int.parse(val));
        //                     }
        //                   },
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Text('\$450',
              style: Theme.of(context).textTheme.headline1,),
            ),
            FormBuilder(
              key: _formKey,
              child: CustomFormField(
                name: RedeemUserVoucherConstants.redeemValue,
                hint: FormFieldHintsContants.redeemValue,
                isRequired: true,
                isNumeric: true,
                initialText:
                userOrBusiness.redeemSomeValue?.redeemValue ??
                    "",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      // onPressed: () {
                      //
                      //   // Navigator.pushReplacement(
                      //   //     context,
                      //   //     MaterialPageRoute(
                      //   //         builder: (BuildContext context) => super.widget));
                      //   //setState(() {});
                      // },
                      onPressed: _handleSaveForm,
                      child: const Text('REDEEM'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _handleSaveForm() async {
    if (_formKey.currentState!.validate()) {
      UserOrBusinessProvider userProvider =
      Provider.of<UserOrBusinessProvider>(context, listen: false);
      _formKey.currentState!.save();
      await UserCollectionHelper().addVoucherDetails(
        userID: userProvider.uid ?? "",
        voucherDetails: _formKey.currentState!.value,
      );
      userProvider.assignVoucherValue();
      Get.to(() => const MyVoucherPage());
    }
  }
}

