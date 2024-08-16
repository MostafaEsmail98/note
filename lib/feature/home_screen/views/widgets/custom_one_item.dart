import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/app_styles.dart';
import '../../manager/provider_note.dart';

class CustomOneItem extends StatelessWidget {
  const CustomOneItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<ProviderNote>(context);
    return Container(
        decoration: BoxDecoration(
          color: provider.notesFilter[index].isDone?Colors.lightGreen:Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0x777C7C7C))),
        child:  ListTile(
          title: Text(
            provider.notesFilter[index].title,
            style: AppStyles.styleBold24,
          ),
          subtitle: Text(
           provider.notesFilter[index].description,
            overflow: TextOverflow.ellipsis,
          ),
        )
    );
  }
}
