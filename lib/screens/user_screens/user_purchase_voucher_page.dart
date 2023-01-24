import 'package:flutter/material.dart';

import '../../widgets/_common/custom_form_field.dart';
import '../../widgets/auto_complete_input_widget.dart';

class PurchaseVoucher extends StatelessWidget {
  const PurchaseVoucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Business Name',
          //style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text('Business Name',
              //       style: Theme.of(context).textTheme.headline2,
              //     ),
              //   ],
              // ),
              const AutocompleteWidget(),
              // const SizedBox(
              //   child: Padding(
              //     padding: EdgeInsets.only(top: 10.0),
              //     child: CustomFormField(
              //       initialText:
              //           "ABC Business", //businessDetails?.businessName ?? "",
              //       name:
              //           "Business Name", //BusinessInfoFormConstants.businessName,
              //       hint:
              //           "Search Business", //FormFieldHintsContants.businessName,
              //       isRequired: true,
              //     ),
              //   ),
              // ),
              const SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: CustomFormField(
                    initialText:
                        "Investment Amount", //businessDetails?.businessName ?? "",
                    name:
                        "Investment Amount", //BusinessInfoFormConstants.businessName,
                    hint: "Start Saving", //FormFieldHintsContants.businessName,
                    isRequired: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Start Date: ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Text("09/20/2022"),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "End Date: ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Text("11/10/2022"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Total Saving: ",
                        style: Theme.of(context).textTheme.headline3),
                    Text("\$100.00",
                        style: Theme.of(context).textTheme.headline2),
                  ],
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
                        onPressed: () {},
                        child: const Text('Purchase'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
