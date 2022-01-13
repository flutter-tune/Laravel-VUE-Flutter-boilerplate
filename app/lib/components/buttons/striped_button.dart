import 'package:app/utilities/const.dart';
import 'package:flutter/material.dart';

class StripedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const StripedButton({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 44,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 1,
              color: kPrimaryColor,
            )),
        child: Text(
          title,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 16,
            fontWeight: kFontMedium,
          ),
        ),
      ),
    );
  }
}
