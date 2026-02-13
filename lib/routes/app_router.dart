import 'package:auto_route/auto_route.dart';
import 'package:proyecto_final/pages/testing_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: TestingRoute.page, initial: true),
  ];
}