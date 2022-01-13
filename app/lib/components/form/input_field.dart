import 'package:app/utilities/const.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final Function validate;
  final Function onChange;
  final String labelText;
  final Icon prefixIcon;
  final String initialVal;
  final int maxLine;
  final bool readOnly;
  const InputField({
    Key? key,
    required this.validate,
    required this.hintText,
    required this.onChange,
    required this.labelText,
    required this.prefixIcon,
    this.maxLine = 1,
    this.initialVal = "",
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      initialValue: initialVal,
      validator: (val) => validate(val),
      onChanged: (val) => onChange(val),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 15.0),
        // isDense: true,
        hintText: hintText,

        hintStyle: TextStyle(
          color: Color(0xFFAFAFAF),
          height: 1.380,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xFF6A6A6A),
          height: 1.38,
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(maxWidth: 42),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Color(0xFFAFAFAF),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
