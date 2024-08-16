import 'package:flutter/material.dart';
import 'package:note/feature/home_screen/views/widgets/custom_app_bar.dart';
import 'package:note/feature/home_screen/views/widgets/custom_calender.dart';

import '../../../core/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 16,
              ),
              CustomCalender(),
              const SizedBox(
                height: 16,
              ),

            ],
          ),
        )
        ,),
    );
  }
}
