import 'package:flutter/material.dart';

import 'package:note/feature/home_screen/views/widgets/custom_add_button.dart';
import 'package:note/feature/home_screen/views/widgets/custom_app_bar.dart';
import 'package:note/feature/home_screen/views/widgets/custom_calender.dart';

import 'package:note/feature/home_screen/views/widgets/custom_list_notes.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return     SafeArea(
      child: Scaffold(
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(),
                SizedBox(
                  height: 16,
                ),
                CustomCalender(),
                SizedBox(
                  height: 16,
                ),
                CustomListNotes()
            
              ],
            ),
          ),
        ),
        floatingActionButton: CustomAddButton()
        ,),
    );
  }
}
