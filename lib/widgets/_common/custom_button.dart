import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final bool showLoader;
  const CustomButton(
      {Key? key, this.title, this.onPressed, this.showLoader = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
      ),
      child: showLoader
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16, top: 8, bottom: 8),
              child: Text(title ?? ""),
            ),
    );
  }
}
