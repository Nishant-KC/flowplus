import 'dart:html';

import 'package:flutter/material.dart';

class UserSavingsPage extends StatelessWidget {
  const UserSavingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Column(
          children: const [
            Flexible(child: Text('Total saving dataviz vs actual price')),
            Flexible(child: Text('ability to break down savings by business')),
            Flexible(
                child:
                    Text('Option to purchase more vouchers from a business')),
            Flexible(
                child: Text('Option to purchase vouchers from a new business')),
          ],
        ),
      ),
    );
  }
}
