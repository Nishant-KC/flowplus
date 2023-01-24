import 'package:flutter/material.dart';

class RedeemValuePage extends StatelessWidget {
  const RedeemValuePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text('Total Voucher Value'),
            Text('Select Redeem Value'),
            Text('Voucher virtual card or bar code is generated'),
            Text('Confirm Redeem Button'),

            //       import 'dart:math';
            //   import 'dart:convert';
            //
            //   String getRandString(int len) {
            // var random = Random.secure();
            // var values = List<int>.generate(len, (i) =>  random.nextInt(255));
            // return base64UrlEncode(values);
            // }
          ],
        ),
      ),
    );
  }
}
