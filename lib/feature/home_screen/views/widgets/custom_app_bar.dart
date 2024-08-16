import 'package:flutter/material.dart';

import '../../../../core/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0x777C7C7C))),
          child: const Text(
            "Notes App",
            style: AppStyles.styleBold24,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
          },
          icon:const Icon(Icons.delete, size: 35,),

        )
      ],
    );
  }
}
