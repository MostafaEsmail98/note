import 'package:flutter/material.dart';

import '../../../../core/app_styles.dart';

class CustomOneItem extends StatelessWidget {
  const CustomOneItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0x777C7C7C))),
        child: const ListTile(
          title: Text(
            "  MyProvider.titles[index]",
            style: AppStyles.styleBold24,
          ),
          subtitle: Text(
            " MyProvider.description[index]",
            overflow: TextOverflow.ellipsis,
          ),
        )
    );
  }
}
