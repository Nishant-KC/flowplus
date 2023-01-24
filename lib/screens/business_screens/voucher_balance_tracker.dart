import 'package:flow_plus/screens/business_screens/business_reg_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../constants/form_constants.dart';
import '../../constants/form_field_hint_constants.dart';
import '../../widgets/_common/custom_form_field.dart';
import '../../widgets/filter_widget.dart';

class VoucherTracker extends StatelessWidget {
  const VoucherTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Vouchers"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Text('Voucher List'),
            // ),
            FormBuilder(
              key: formKey,
              child: CustomFormField(
                //initialText: businessDetails?.businessName ?? "",
                name: UserIdSearchFormConstant.userIdSearch,
                hint: FormFieldHintsContants.search,
                isRequired: false,
              ),
            ),

            const SizedBox(
              height: 60,
              child: FilterWidget(
                title: '',
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           TextButtonStyle(
            //             label: "Business Type",
            //             onTap: _newView,
            //           ),
            //           TextButtonStyle(
            //             label: "Campaign Size",
            //             onTap: _newView,
            //           ),
            //           TextButtonStyle(
            //             label: "Radius",
            //             onTap: _newView,
            //           ),
            //           TextButtonStyle(
            //             label: "Top Savings",
            //             onTap: _newView,
            //           ),
            //           InkWell(
            //             onTap: () {},
            //             splashColor: Colors.blueGrey.withOpacity(0.5),
            //             splashFactory: InkRipple.splashFactory,
            //             highlightColor: Colors.blue.withOpacity(0.4),
            //             borderRadius: BorderRadius.circular(50),
            //             child: const Padding(
            //               padding: EdgeInsets.all(8.0),
            //               child: Icon(Icons.refresh),
            //             ),
            //           ),
            //
            //           // InkWell(
            //           //     onTap: (){},
            //           //     child: const Text('data')),
            //           // InkWell(
            //           //     onTap: (){},
            //           //     child: const Text('data')),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: 3,
              height: 20,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  //physics: ClampingScrollPhysics,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 400, child: FilterList());
                    //   InkWell(
                    //   onTap: () {},
                    //   splashColor: Colors.blue.withOpacity(0.9),
                    //   splashFactory: InkRipple.splashFactory, // this.
                    //   //overlayColor: overlayColor,
                    //   //highlightColor: Colors.transparent, // and here
                    //   highlightColor: Colors.blue.withOpacity(0.7),
                    //   borderRadius: BorderRadius.circular(25),
                    //   child: const ListTile(
                    //     leading: UserAvatar(radius: 60,),
                    //     // CircleAvatar(
                    //     //   backgroundImage:
                    //     //       AssetImage('assets/images/usr_pwd_icon.jpeg'),
                    //     // ),
                    //     title: Text('Current Voucher Balance'),
                    //     subtitle: Text('Total Amount Spent'),
                    //     trailing: Icon(Icons.manage_accounts),
                    //     tileColor: Colors.white54,
                    //   ),
                    // );
                  }),
            )
          ],
        ),
      ),
    );
  }

  _newView() => Get.to(const BusinessRegistrationForm());
}
