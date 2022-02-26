import 'package:by_onboarding_login_page/utility/strings.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController codeController;
  final TextInputType textInputType;
  final String labelText;
  bool hidePassword;
  final bool iconVisible;
  final FocusNode focusNode;
  var prefixIcon;
  var suffixIcon;
  CustomTextFormField(
      {Key? key,
      required this.codeController,
      required this.textInputType,
      required this.labelText,
      this.hidePassword = false,
      this.iconVisible = false,
      required this.focusNode,
      required this.prefixIcon,
      required this.suffixIcon})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Bu alanı boş bırakamazsınız.";
          }
          if (value.length < 6) {
            return "6 dan küçük olamaz";
          }
          if (value.length > 20) {
            return "20 den büyük olamaz";
          }
        },
        focusNode: widget.focusNode,
        controller: widget.codeController,
        keyboardType: widget.textInputType,
        obscureText: widget.hidePassword,
        decoration: widget.labelText == AppStrings().passwordText
            ? InputDecoration(
                labelText: widget.labelText,
                labelStyle: Theme.of(context).textTheme.headline5,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.indigoAccent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.indigoAccent)),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.hidePassword = !widget.hidePassword;
                      });
                    },
                    icon: Icon(widget.hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    color: Colors.indigoAccent))
            : InputDecoration(
                labelText: widget.labelText,
                labelStyle: Theme.of(context).textTheme.headline5,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.indigoAccent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.indigoAccent)),
              ),
      ),
    );
  }
}
