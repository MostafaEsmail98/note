import 'package:flutter/material.dart';
import 'package:note/feature/home_screen/manager/provider_note.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var provider =  Provider.of<ProviderNote>(context);
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
            provider.deleteAll();
          },
          icon:const Icon(Icons.delete, size: 35,),

        )
      ],
    );
  }
}
