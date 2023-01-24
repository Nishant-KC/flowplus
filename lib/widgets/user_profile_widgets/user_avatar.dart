import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double radius;
  const UserAvatar({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: NetworkImage(
          'https://cdn.pixabay.com/photo/2019/09/29/22/06/light-bulb-4514505_1280.jpg'),
    );
  }
}
