import 'package:auto_route/auto_route.dart';
import 'package:proyecto_final/pages/choose_class_page.dart';
import 'package:proyecto_final/pages/enrolled_courses_page.dart';
import 'package:proyecto_final/pages/login_page.dart';
import 'package:proyecto_final/pages/profile_page.dart';
import 'package:proyecto_final/pages/register_page.dart';
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
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: ChooseClassRoute.page),
    AutoRoute(page: EnrolledCoursesRoute.page),
    AutoRoute(page: TestingRoute.page),
  ];
}