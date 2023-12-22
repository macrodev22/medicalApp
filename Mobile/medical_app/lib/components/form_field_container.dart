import 'package:flutter/material.dart';
import 'package:medical_app/components/colors.dart';

class FormFieldContainer extends StatefulWidget {
  const FormFieldContainer(
      {super.key,
      this.fieldKey,
      this.controller,
      this.helperText,
      this.hintText,
      this.inputType,
      this.isPasswordField = false,
      this.labelText,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator});

  final TextEditingController? controller;
  final Key? fieldKey;
  final bool isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  @override
  State<FormFieldContainer> createState() => _FormFieldContainerState();
}

class _FormFieldContainerState extends State<FormFieldContainer> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        style: const TextStyle(color: primary),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
          fillColor: Colors.white,
          filled: true,
          hintStyle: const TextStyle(color: Colors.black45),
          hintText: widget.hintText,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField
                ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText ? Colors.grey : Colors.green,
                  )
                : const Text(" "),
          ),
        ),
      ),
    );
  }
}
