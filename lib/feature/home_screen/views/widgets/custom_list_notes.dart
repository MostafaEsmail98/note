import 'package:flutter/material.dart';
import 'package:note/feature/home_screen/views/widgets/custom_edit_and_delete_button.dart';
import 'package:note/feature/home_screen/views/widgets/custom_one_item.dart';
import 'package:provider/provider.dart';

import '../../manager/provider_note.dart';



class CustomListNotes extends StatelessWidget {
  const CustomListNotes({super.key});

  @override
  Widget build(BuildContext context) {
   var provider = Provider.of<ProviderNote>(context);
    return ListView.builder(
      itemCount: provider.notesFilter.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
      return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomEditAndDeleteButton(
            index: index,
            widget: CustomOneItem(index: index,))
      );
    },);
  }
}
