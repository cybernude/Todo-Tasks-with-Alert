import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:todo_tasks_with_alert/model/event.dart';
import 'package:todo_tasks_with_alert/modules/search_events/search_controller.dart';
import 'package:todo_tasks_with_alert/shared/componets/componets.dart';
import 'package:todo_tasks_with_alert/shared/styles/styles.dart';

class SearchEvents extends StatelessWidget {
  List<String> list_of_menuItem = [
    'Day',
    'Week',
    'Work Week',
    'Month',
    'Schedule'
  ];
  var searchController_needed = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (searchController) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Event Calendar',
                  style: eventheaderStyle,
                ),
                // actions: [
                //   _dropdown_menu_item(),
                // ],
              ),
              body: SfCalendar(
                allowedViews: [
                  CalendarView.day,
                  CalendarView.week,
                  CalendarView.workWeek,
                  CalendarView.month,
                  CalendarView.schedule
                ],
                view: CalendarView.month,
                firstDayOfWeek: 1,
                monthViewSettings: const MonthViewSettings(
                    showAgenda: true,
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
                onTap: (CalendarTapDetails calendarTapDetails) {
                  print(calendarTapDetails.date.toString());
                },
                onViewChanged: (viewChangedDetails) {
                  int month = viewChangedDetails
                      .visibleDates[viewChangedDetails.visibleDates.length ~/ 2]
                      .month;
                },
              ));
        });
  }

  // _dropdown_menu_item() {
  //   return PopupMenuButton(
  //     onSelected: (value) {},
  //     icon: const Icon(Icons.calendar_month),
  //     itemBuilder: (context) => [
  //       ...list_of_menuItem.map((e) => PopupMenuItem(
  //             textStyle: Theme.of(context).textTheme.subtitle2,
  //             child: Text(e.toString()),
  //             value: e,
  //           )),
  //     ],
  //   );
  // }
}
