import 'package:flutter/material.dart';

import '../../../../core/app_styles.dart';

class CustomListNotes extends StatelessWidget {
  const CustomListNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
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
        ),
      );
    },);
  }
}
