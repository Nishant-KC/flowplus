// import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
// import 'package:flutter/material.dart';
//
// class SwipeDotWidget extends StatelessWidget {
//   const SwipeDotWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DotPaginationSwiper(
//         children:  <Widget>[
//           Center(child: Card(
//             //color: Colors.blueGrey.shade100,
//             color: Theme.of(context).colorScheme.secondary,
//             margin: const EdgeInsets.only(top: 20.0),
//             child: SizedBox(
//                 height: 200.0,
//                 width: double.infinity,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 30.0, left: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.spaceEvenly,
//                         //crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "2022",
//                             style:
//                             Theme.of(context).textTheme.bodyText1,
//                           ),
//                           Text(
//                             "2023",
//                             style:
//                             Theme.of(context).textTheme.bodyText1,
//                           ),
//                           Text(
//                             "2024",
//                             style:
//                             Theme.of(context).textTheme.bodyText1,
//                           ),
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Investment: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$700.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Investment: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$600.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Investment: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$900.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Savings: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$200.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Savings: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$100.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Savings: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$300.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )),
//           ),),
//           Center(child: Card(
//             //color: Colors.blueGrey.shade100,
//             color: Theme.of(context).colorScheme.secondary,
//             margin: const EdgeInsets.only(top: 20.0),
//             child: SizedBox(
//                 height: 200.0,
//                 width: double.infinity,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 30.0, left: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.spaceEvenly,
//                         //crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "2022",
//                             style:
//                             Theme.of(context).textTheme.bodyText1,
//                           ),
//                           Text(
//                             "2023",
//                             style:
//                             Theme.of(context).textTheme.bodyText1,
//                           ),
//                           Text(
//                             "2024",
//                             style:
//                             Theme.of(context).textTheme.bodyText1,
//                           ),
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Investment: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$700.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Investment: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$600.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Investment: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$900.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Savings: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$200.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Savings: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$100.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Total Savings: ",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall,
//                               ),
//                               Text(
//                                 "\$300.00",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )),
//           ),),
//           // Center(child: Text('Page 3')),
//           // Center(child: Text('Page 4')),
//           // Center(child: Text('Page 5')),
//         ],
//       ),
//     );
//   }
// }
