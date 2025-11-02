import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flutter/material.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

class CalendarPage extends LayoutWidget {
  const CalendarPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.calendarPageTitle;
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = MediaQuery.of(context).size.width < 768;
    final calendarHeight = isMobile
        ? screenHeight * 0.75
        : 800.0;

    return CommonCard(
      height: calendarHeight,
      padding: const EdgeInsets.all(1),
      child: SfCalendar(
        view: CalendarView.month,
        todayTextStyle: const TextStyle(color: GlobalColors.primary),
        todayHighlightColor: Colors.white,
        headerStyle: const CalendarHeaderStyle(
          backgroundColor: Colors.transparent,
        ),
        monthViewSettings: MonthViewSettings(
            showAgenda: true,
            agendaViewHeight: isMobile ? 150 : 200,
            agendaStyle: const AgendaStyle(
                appointmentTextStyle: TextStyle(color: GlobalColors.danger)),
            monthCellStyle: const MonthCellStyle(
              trailingDatesBackgroundColor: Colors.transparent,
              leadingDatesBackgroundColor: Colors.transparent,
            )),
        cellBorderColor: GlobalColors.border,
        viewHeaderHeight: isMobile ? 50 : 60,
        headerHeight: isMobile ? 50 : 60,
        viewHeaderStyle: ViewHeaderStyle(
          backgroundColor: GlobalColors.primary,
          dayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 16 : 20,
          ),
        ),
      ),
    );
  }
}
