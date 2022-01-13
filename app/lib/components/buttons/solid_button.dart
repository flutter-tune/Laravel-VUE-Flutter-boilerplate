import 'package:app/utilities/const.dart';
import 'package:flutter/material.dart';

class SolidButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const SolidButton({
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
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: kFontMedium,
          ),
        ),
      ),
    );
  }
}
