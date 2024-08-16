import 'package:flutter/material.dart';

import '../../../../../core/app_styles.dart';

class TextFieldOfAdd extends StatelessWidget {
  const TextFieldOfAdd({super.key, required this.controller, required this.text});
  final TextEditingController controller ;
  final String text ;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      enabled: true,
      decoration:  InputDecoration(
          hintText: text,
          hintStyle: AppStyles.styleRegular14,
          filled: true,
          fillColor: const Color(0xffE2E2E2),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12)))),
    );
  }
}
