import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      this.controller,
      this.Text,
      this.hintText,
      this.pIcon1,
      this.pIcon2,
      this.sIcon,
      this.validator,
      this.obscureText})
      : super(key: key);

  dynamic validator;
  TextEditingController? controller;
  String? hintText, Text;
  IconData? pIcon1, pIcon2, sIcon;
  bool? obscureText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: widget.obscureText!,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        alignLabelWithHint: true,
        hintStyle: const TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
        prefixIcon: Container(
            height: 60,
            width: 50,
            color: Colors.black54,
            child: IconButton(
              icon: Icon(
                  widget.obscureText == true ? widget.pIcon1 : widget.pIcon2),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  widget.obscureText = !(widget.obscureText!);
                });
              },
            )),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.4), width: 1)),
        filled: true,
        fillColor: Colors.black54,
      ),
    );
  }
}
