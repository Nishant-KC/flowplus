import 'package:flow_plus/data/controllers/business_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TwoStateButton extends StatelessWidget {
  TwoStateButton({Key? key}) : super(key: key);
  final businessCategoryController = Get.find<BusinessCategoryController>();
  @override
  Widget build(BuildContext context) {
    final businessCategories = Provider.of<List<Map>>(context);
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: businessCategories.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        businessCategoryController
                            .addOrRemoveCategory(businessCategories[index]);
                      },
                      child: Container(
                        decoration: businessCategoryController
                                .selectedCategories.value
                                .contains(businessCategories[index])
                            ? const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.deepOrange,
                                      Colors.purpleAccent,
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight),
                              )
                            : const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          //padding: const EdgeInsets.only(top: 4,right: 4,left: 4,bottom: 8),
                          child: CircleAvatar(
                            radius: businessCategoryController
                                    .selectedCategories.value
                                    .contains(businessCategories[index])
                                ? 24
                                : 20,
                            backgroundImage: NetworkImage(
                                businessCategories[index]['category_image']),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        businessCategories[index]['category_name'],
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class TwoStateButton extends StatefulWidget {
//   const TwoStateButton({Key? key}) : super(key: key);

//   @override
//   _TwoStateButtonState createState() => _TwoStateButtonState();
// }

// class _TwoStateButtonState extends State<TwoStateButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: _showButton1 ? _button1() : _button2());
//   }

//   _button1() {
// return
//   }

//   _button2() {
//     return GestureDetector(
//       onTap: () => setState(() {
//         _showButton1 = true;
//       }),
//       child: Container(

//         child: const Padding(
//           padding: EdgeInsets.all(0.0),
//           child: CircleAvatar(
//             backgroundColor: Colors.transparent,
//             radius: 24,
//             child: CircleAvatar(
//               radius: 20,
//               backgroundImage: NetworkImage(
//                   'https://cdn.pixabay.com/photo/2019/09/29/22/06/light-bulb-4514505_1280.jpg'),
//             ),
//           ),
//         ),
//       ),
//     );
//     //   Button(
//     //     onPressed: () => setState(() {
//     //       _showButton1 = false;
//     //     })
//     // );
//   }
// }
