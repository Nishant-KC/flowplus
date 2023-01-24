import 'package:flow_plus/screens/user_screens/user_purchase_voucher_page.dart';
import 'package:flow_plus/screens/user_screens/user_redeem_voucher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/user_profile_widgets/user_avatar.dart';
import 'manage_investment_vouchers.dart';

class MyVoucherPage extends StatelessWidget {
  const MyVoucherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<BusinessFinancialDetailsModel> businessFinancial =
    // Provider.of<List<BusinessFinancialDetailsModel>>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Voucher Details"),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Add your onPressed code here!
        //     Get.to(() => const PurchaseVoucher());
        //   },
        //   child: const Icon(
        //     Icons.join_full,
        //     color: Colors.black45,
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Stack(
                  children: <Widget>[
                    Card(
                      //color: Colors.blueGrey.shade100,
                      color: Theme.of(context).colorScheme.secondary,
                      margin: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                          height: 200.0,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "2022",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      "2023",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      "2024",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Total Investment: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        Text(
                                          "\$700.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total Investment: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        Text(
                                          "\$600.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total Investment: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        Text(
                                          "\$900.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Total Savings: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        Text(
                                          "\$200.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total Savings: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        Text(
                                          "\$100.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total Savings: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        Text(
                                          "\$300.00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                    // DotPaginationSwiper(),
                    const Positioned(
                      top: .0,
                      left: .0,
                      right: .0,
                      child: Center(
                        child: SizedBox(
                            //height: 40,
                            //how 5an we make the avatar larger
                            child: UserAvatar(
                          radius: 100,
                        )),
                      ),
                    )
                  ],
                ),
              ),
              //const Text('Business List'),
              SizedBox(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: InkWell(
                          onTap: () {
                            Get.to(() => const ManageInvestmentVouchers());
                          },
                          child: CircleAvatar(
                            radius: 20.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000.0),
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_1280.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        title: InkWell(
                            onTap: () {
                              //Get.to(() => const ManageInvestmentVouchers());
                            },
                            child: const Text("Business Name")),
                        subtitle: InkWell(
                          onTap: (){
                            Get.to(const RedeemVoucherWidget());
                          },
                            child: const Text('\$42.00 | Redeem Investment')),
                        trailing: InkWell(
                          onTap: (){
                            Get.to(() => const PurchaseVoucher());
                          },
                          child: const Icon(
                            Icons.join_full,
                            color: Colors.black45,
                          ),
                        ),
                        // trailing: InkWell(
                        //     onLongPress: () {
                        //       Get.to(() => const LocalCampaignProfilePage());
                        //     },
                        //     child: const Text('Savings \$40.00')),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Theme.of(context).colorScheme.primary,
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
