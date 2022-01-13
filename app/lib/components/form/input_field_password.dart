import 'package:app/utilities/const.dart';
import 'package:flutter/material.dart';

class InputFieldPassword extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Function validate;
  final Function onChange;
  final String prefixIcon;
  const InputFieldPassword({
    Key? key,
    required this.validate,
    required this.hintText,
    required this.onChange,
    required this.labelText,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  _InputFieldPasswordState createState() => _InputFieldPasswordState();
}

class _InputFieldPasswordState extends State<InputFieldPassword> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 46,
      child: TextFormField(
        validator: (val) => widget.validate(val),
        onChanged: (val) => widget.onChange(val),
        obscureText: hidePassword,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          hintStyle: TextStyle(
            color: Color(0xFFAFAFAF),
            height: 1.380,
          ),
          labelStyle: TextStyle(
            color: Color(0xFF6A6A6A),
            height: 1.38,
          ),
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
          prefixIcon: Container(
            width: 42,
            height: 18,
            margin: EdgeInsets.only(top: 2, left: 2),
            child: Icon(Icons.lock),
          ),
          prefixIconConstraints: BoxConstraints(maxWidth: 42),
          suffixIcon: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              hidePassword ? Icons.visibility_off : Icons.visibility,
              size: 19,
              color: Color(0XFFAFAFAF),
            ),
            onPressed: () {
              setState(
                () {
                  hidePassword = !hidePassword;
                  print(hidePassword);
                },
              );
            },
          ),
          suffixIconConstraints: BoxConstraints(maxHeight: 42),
        ),
      ),
    );
  }
}
