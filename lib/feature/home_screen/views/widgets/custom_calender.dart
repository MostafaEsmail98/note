import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:note/core/app_styles.dart';
import 'package:note/feature/home_screen/manager/provider_note.dart';
import 'package:provider/provider.dart';

class CustomCalender extends StatelessWidget {
    const CustomCalender({super.key});

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<ProviderNote>(context);
    return EasyInfiniteDateTimeLine(
      dayProps: EasyDayProps(
          borderColor: const Color(0x777C7C7C),
          inactiveDayStyle: const DayStyle(
              monthStrStyle: AppStyles.styleRegular12,
              dayStrStyle: AppStyles.styleRegular12,
              dayNumStyle: AppStyles.styleBold24),
          activeDayStyle: DayStyle(
              dayNumStyle: AppStyles.styleBold24.copyWith(color: Colors.white),
              dayStrStyle:
              AppStyles.styleRegular12.copyWith(color: Colors.white),
              monthStrStyle:
              AppStyles.styleRegular12.copyWith(color: Colors.white)),
          todayStyle: const DayStyle(
              monthStrStyle: AppStyles.styleRegular12,
              dayStrStyle: AppStyles.styleRegular12,
              dayNumStyle: AppStyles.styleBold24)),
      showTimelineHeader: false,
      activeColor: Colors.black,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      focusDate: provider.time,
      lastDate: DateTime.now().add(const Duration(days: 365)),
      onDateChange: (selectedDate) {
      provider.selectedTime(selectedDate);
      provider.filter();
      },
    );
  }
}
