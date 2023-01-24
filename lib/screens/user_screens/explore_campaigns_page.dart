import 'package:flutter/material.dart';

import '../../constants/form_field_hint_constants.dart';
import '../../widgets/_common/custom_form_field.dart';

class ExploreCampaignsPage extends StatelessWidget {
  const ExploreCampaignsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: CustomFormField(
                  initialText:
                      "search for campaigns", //businessDetails?.businessName ?? "",
                  name:
                      "search for campaigns", //BusinessInfoFormConstants.businessName,
                  hint: "Campaigns", //FormFieldHintsContants.businessName,
                  isRequired: true,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Let\'s Explore',
                      textAlign: TextAlign.left,
                    )),
              ),
              const Divider(),
              SizedBox(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext content, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: SizedBox(
                            height: 500,
                            child: Card(
                              color: Colors.blueGrey,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.network(
                                  'https://via.placeholder.com/300?text=DITTO',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
