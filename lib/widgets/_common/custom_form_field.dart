import 'package:flow_plus/constants/form_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String name;
  final bool? isHidden;
  final bool isRequired;
  final bool isNumeric;
  final bool isEmail;
  final int maxChars;
  final String? initialText;
  const CustomFormField({
    Key? key,
    this.controller,
    this.hint,
    this.isHidden,
    this.isRequired = false,
    this.isNumeric = false,
    this.isEmail = false,
    this.initialText,
    required this.name,
    this.maxChars = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: FormBuilderTextField(
        name: name,
        controller: controller,
        initialValue: initialText,
        obscureText: isHidden ?? false,
        valueTransformer: (val) {
          if (isNumeric) {
            return num.tryParse(val ?? "");
          } else {
            return val;
          }
        },
        validator: FormBuilderValidators.compose(
          [
            if (isRequired)
              FormBuilderValidators.required(
                  errorText: FormErrorConstants.requiredText),
            if (isNumeric)
              FormBuilderValidators.numeric(
                  errorText: FormErrorConstants.numericText),
            if (maxChars != 0)
              FormBuilderValidators.maxLength(
                maxChars,
                errorText: FormErrorConstants.maxErrText(maxChars),
              ),
            if (isEmail)
              FormBuilderValidators.email(
                errorText: FormErrorConstants.email,
              ),
          ],
        ),
        decoration: InputDecoration(
          label: Text(hint!),
          hintText: hint,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              width: 2.0,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
