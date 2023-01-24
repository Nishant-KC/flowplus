import 'package:flutter/material.dart';

class TextButtonStyle extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const TextButtonStyle({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        splashColor: Colors.blueGrey.withOpacity(0.5),
        splashFactory: InkRipple.splashFactory, // this.
        //overlayColor: overlayColor,
        //highlightColor: Colors.transparent, // and here
        highlightColor: Colors.blue.withOpacity(0.4),
        borderRadius: BorderRadius.circular(50),
        //splashColor: Colors.green.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ));
  }
}
