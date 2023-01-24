import 'package:cached_network_image/cached_network_image.dart';
import 'package:flow_plus/constants/hive_constants.dart';
import 'package:flow_plus/data/models/business_details_model.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flow_plus/screens/login_screens/login_page.dart';
import 'package:flow_plus/screens/user_screens/user_search_page.dart';
import 'package:flow_plus/widgets/user_profile_widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../widgets/snap_into_place_cards.dart';
import 'explore_campaigns_page.dart';
import 'local_campaign_profile_page.dart';
import 'my_vouchers_page.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List <BusinessCategoryModel> typeOfBusiness = [
    //   {"categoryImage": "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
    //     "categoryName": "Restaurant"},
    //   {"category_image": "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg",
    //     "category_name": "Clothing"},
    //   {"category_image": "https://cdn.pixabay.com/photo/2017/02/01/22/02/mountain-landscape-2031539_960_720.jpg",
    //     "category_name": "Clothing"},
    //   {"category_image": "https://cdn.pixabay.com/photo/2014/09/14/18/04/dandelion-445228_960_720.jpg",
    //     "category_name": "Clothing"},
    //   {"category_image": "https://cdn.pixabay.com/photo/2016/08/09/21/54/yellowstone-national-park-1581879_960_720.jpg",
    //     "category_name": "Clothing"},
    //   {"category_image": "https://cdn.pixabay.com/photo/2016/07/11/15/43/pretty-woman-1509956_960_720.jpg",
    //     "category_name": "Clothing"},
    //   {"category_image": "https://cdn.pixabay.com/photo/2016/08/09/21/54/yellowstone-national-park-1581879_960_720.jpg",
    //     "category_name": "Clothing"},
    //   {"category_image": "https://cdn.pixabay.com/photo/2016/07/11/15/43/pretty-woman-1509956_960_720.jpg",
    //     "category_name": "Clothing"},
    //
    // ];
    // List<BusinessCategoryModel> typeOfBusiness = [
    //   BusinessCategoryModel("Restaurant","https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",),
    //   BusinessCategoryModel("Restaurant","https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",),
    //   BusinessCategoryModel("Restaurant","https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",),
    //   BusinessCategoryModel("Restaurant","https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",),
    //   BusinessCategoryModel("Restaurant","https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",),
    //   BusinessCategoryModel("Restaurant","https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",),
    //   BusinessCategoryModel("Restaurant","https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",),
    //   BusinessCategoryModel("Restaurant","https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",),
    // ];

    final List<BusinessDetailsModel> businesses =
        Provider.of<List<BusinessDetailsModel>>(context);

    // final List<BusinessCategoryModel> categories =
    // Provider.of<List<BusinessCategoryModel>>(context);

    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                Hive.box(HiveConstants.boxName).clear();
                Get.offAll(() => LoginPage());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.arrowRightFromBracket),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const UserAvatar(radius: 30),
                        const SizedBox(width: 10),
                        Text(Provider.of<UserOrBusinessProvider?>(context)!
                                .userDetails
                                ?.firstName ??
                            "Username"),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     InkWell(
                    //         onTap: () {
                    //           Get.to(() => const MyVoucherPage());
                    //         },
                    //         child: const Padding(
                    //           padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    //           child: Icon(Icons.account_balance_wallet),
                    //         )),
                    //     InkWell(
                    //         onTap: () { 
                    //           Get.to(() => const PurchaseVoucher());
                    //         },
                    //         child: const Padding(
                    //           padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    //           child: Icon(Icons.join_full),
                    //         )),
                    //   ],
                    // ),
                  ],
                ),
              ),

              const Divider(),
              Stack(
                children: [
                  const SizedBox(
                    height: 300,
                    width: double.infinity,
                  ),
                  Container(
                    height: 260,
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Text(
                      'Your Local Campaigns',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Positioned(
                      child: Center(
                    child: SizedBox(
                      height: 240,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              //typeOfBusiness[].length,
                              businesses.length,
                          //categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 40.0, bottom: 20),
                              child: SizedBox(
                                width: 180,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => LocalCampaignProfilePage(
                                        businessDetailsModel: businesses[index],
                                      ),
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: CachedNetworkImage(
                                              imageUrl: businesses[index]
                                                      .imageName ??
                                                  'https://via.placeholder.com/300?text=DITTO',
                                              errorWidget: (context, name, e) {
                                                return const Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                );
                                              },
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              businesses[index].businessName!,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )),
                  Positioned(
                      bottom: 18,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Spacer(),
                          SizedBox(
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const MyVoucherPage());
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('My Savings'),
                                  Icon(Icons.description),
                                ],
                              ),
                            ),
                          ),
                          //Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(() => const ExploreCampaignsPage());
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Explore'),
                                // Icon(Icons.travel_explore)
                                Icon(Icons.explore)
                              ],
                            ),
                          ),
                          //Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(() => const UserSearchPage());
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Search'),
                                Icon(Icons.search)
                              ],
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: (){},
                          //   child: Text('New'),
                          // ),
                          //Spacer(),
                        ],
                      ))
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Business Category',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              // ShaderMask(
              //   shaderCallback: (rect) {
              //     return const LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [Colors.black, Colors.transparent],
              //     ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              //   },
              //   blendMode: BlendMode.dstIn,
              //   child: const SizedBox(height: 300, child: SnapInCards()),
              //   // Image.network(
              //   //   'https://via.placeholder.com/300?text=DITTO',
              //   //   fit: BoxFit.fitWidth,
              //   //   height: 250,
              //   // ),
              // ),
              //const SnapInCards(),
              const SizedBox(height: 280, child: SnapInCards()),
            ],
          ),
        )
        // Center(
        //   child: ElevatedButton(
        //     onPressed: (){},
        //     child: Text('User Profile'),
        //   ),
        // ),
        );
  }
}
