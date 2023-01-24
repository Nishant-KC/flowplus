// import 'package:flutter/material.dart';
//
import 'package:provider/provider.dart';

import '../../data/providers/user_or_business_provider.dart';
import 'business_profile_page.dart';
import 'business_reg_form.dart';
import 'financial_details_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'manage_campaign.dart';

class BusinessHealthWidget extends StatefulWidget {
  const BusinessHealthWidget({Key? key}) : super(key: key);

  @override
  State<BusinessHealthWidget> createState() => _BusinessHealthWidgetState();
}

class _BusinessHealthWidgetState extends State<BusinessHealthWidget> {
  @override
  Widget build(BuildContext context) {
    UserOrBusinessProvider userOrBusiness =
        Provider.of<UserOrBusinessProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Business Health'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'How Solid is your Business Health?',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 8.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: Row(
                      children: [
                        // Text(
                        //   '\$4,000.00',
                        //   style: Theme.of(context).textTheme.headline2,
                        // ),
                        Text(
                          (userOrBusiness.businessFinanceDetails?.burnRate() ??
                                  "")
                              .toString(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                    child: Row(
                      children: [
                        Text('Fixed expense monthly burn Rate',
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: Row(
                      children: [
                        Text(
                          '3 Months',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'Break even point from Profit (Min. Avg. \$${userOrBusiness.businessFinanceDetails?.burnRate() ?? ""})',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ), //gross sales minus (monthly operating expenses plus payroll plus cost of business earnings) increment balance for(i=0;i<=5;i++){ [print] }
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 20.0),
            //   child: Container(
            //     width: double.infinity,
            //     height: 110,
            //     color: Colors.grey.shade400,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Flexible(
            //           child: Text(
            //             'View Your List of Investors',
            //             style: Theme.of(context).textTheme.caption,
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(8.0),
            //             child: Stack(
            //               children: <Widget>[
            //                 Positioned.fill(
            //                   child: Container(
            //                     decoration: const BoxDecoration(
            //                       gradient: LinearGradient(
            //                         colors: <Color>[
            //                           Color(0xFF0D47A1),
            //                           Color(0xFF1976D2),
            //                           Color(0xFF42A5F5),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 TextButton(
            //                   style: TextButton.styleFrom(
            //                     padding: const EdgeInsets.all(16.0),
            //                     primary: Colors.white,
            //                     textStyle: const TextStyle(fontSize: 20),
            //                   ),
            //                   onPressed: () {
            //                     Get.to(() => const FinancialDetailsForm());
            //                   },
            //                   child: const Text('Investor List'),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              width: double.infinity,
              height: 110,
              color: Colors.grey.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      'Update Financial Information For More Accurate Health Report',
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.center,
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
                            onPressed: () {
                              Get.to(() => const FinancialDetailsForm());
                            },
                            child: const Text('Update Financial Details'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                width: double.infinity,
                height: 110,
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Text(
                        'Create New Campaign or Update Campaign Details',
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.center,
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
                              onPressed: () {
                                Get.to(() => ManageCampaign());
                              },
                              child: const Text('Campaign Details'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /*SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const ListTile(
                      leading: CircleAvatar(),
                      title: Text("hello"),
                    );
                  }),
            )*/
            //FinancialFormWidget()
          ],
        ),
      ),
    );
  }
}
