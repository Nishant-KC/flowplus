import 'package:flutter/material.dart';

import '../../widgets/_common/custom_form_field.dart';
import '../../widgets/auto_complete_input_widget.dart';

class UserSearchPage extends StatelessWidget {
  const UserSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Search Campaigns and businesses'),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 10.0),
              //   child: CustomFormField(
              //     initialText:
              //         "Search Businesses", //businessDetails?.businessName ?? "",
              //     name:
              //         "search for campaigns", //BusinessInfoFormConstants.businessName,
              //     hint: "Search", //FormFieldHintsContants.businessName,
              //     isRequired: true,
              //   ),
              // ),
              AutocompleteWidget(),
              Divider(
                color: Colors.black,
                indent: 10,
                endIndent: 10,
              ),
            ],
          ),
        ));
  }
}
