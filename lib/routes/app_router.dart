import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/attendance_page.dart';
import 'package:proyecto_final/pages/attendance_report_list_page.dart';
import 'package:proyecto_final/pages/choose_class_page.dart';
import 'package:proyecto_final/pages/course_attendance_report_page.dart';
import 'package:proyecto_final/pages/course_attendance_page.dart';
import 'package:proyecto_final/pages/course_detail_page.dart';
import 'package:proyecto_final/pages/create_course_page.dart';
import 'package:proyecto_final/pages/enrolled_courses_page.dart';
import 'package:proyecto_final/pages/login_page.dart';
import 'package:proyecto_final/pages/profile_page.dart';
import 'package:proyecto_final/pages/qr_generator_page.dart';
import 'package:proyecto_final/pages/qr_scan_page.dart';
import 'package:proyecto_final/pages/register_page.dart';
import 'package:proyecto_final/pages/teacher_home_page.dart';
import 'package:proyecto_final/pages/testing_page.dart';
import 'package:proyecto_final/pages/under_construction_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(path: '/register', page: RegisterRoute.page),
    AutoRoute(page: UnderConstructionRoute.page),
    AutoRoute(page: TeacherHomeRoute.page),
    AutoRoute(page: CreateCourseRoute.page),
    AutoRoute(page: CourseDetailRoute.page),
    AutoRoute(page: AttendanceRoute.page),
    AutoRoute(page: CourseAttendanceRoute.page),
    AutoRoute(page: AttendanceReportListRoute.page),
    AutoRoute(page: CourseAttendanceReportRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: QrGeneratorRoute.page),
    AutoRoute(page: QrScanRoute.page),
    AutoRoute(page: ChooseClassRoute.page),
    AutoRoute(page: EnrolledCoursesRoute.page),
    AutoRoute(page: TestingRoute.page),
  ];
}