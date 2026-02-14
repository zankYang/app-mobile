// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AttendancePage]
class AttendanceRoute extends PageRouteInfo<void> {
  const AttendanceRoute({List<PageRouteInfo>? children})
    : super(AttendanceRoute.name, initialChildren: children);

  static const String name = 'AttendanceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AttendancePage();
    },
  );
}

/// generated route for
/// [AttendanceReportListPage]
class AttendanceReportListRoute extends PageRouteInfo<void> {
  const AttendanceReportListRoute({List<PageRouteInfo>? children})
    : super(AttendanceReportListRoute.name, initialChildren: children);

  static const String name = 'AttendanceReportListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AttendanceReportListPage();
    },
  );
}

/// generated route for
/// [ChooseClassPage]
class ChooseClassRoute extends PageRouteInfo<void> {
  const ChooseClassRoute({List<PageRouteInfo>? children})
    : super(ChooseClassRoute.name, initialChildren: children);

  static const String name = 'ChooseClassRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChooseClassPage();
    },
  );
}

/// generated route for
/// [CourseAttendancePage]
class CourseAttendanceRoute extends PageRouteInfo<void> {
  const CourseAttendanceRoute({List<PageRouteInfo>? children})
    : super(CourseAttendanceRoute.name, initialChildren: children);

  static const String name = 'CourseAttendanceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CourseAttendancePage();
    },
  );
}

/// generated route for
/// [CourseAttendanceReportPage]
class CourseAttendanceReportRoute extends PageRouteInfo<void> {
  const CourseAttendanceReportRoute({List<PageRouteInfo>? children})
    : super(CourseAttendanceReportRoute.name, initialChildren: children);

  static const String name = 'CourseAttendanceReportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CourseAttendanceReportPage();
    },
  );
}

/// generated route for
/// [CourseDetailPage]
class CourseDetailRoute extends PageRouteInfo<void> {
  const CourseDetailRoute({List<PageRouteInfo>? children})
    : super(CourseDetailRoute.name, initialChildren: children);

  static const String name = 'CourseDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CourseDetailPage();
    },
  );
}

/// generated route for
/// [CreateCoursePage]
class CreateCourseRoute extends PageRouteInfo<void> {
  const CreateCourseRoute({List<PageRouteInfo>? children})
    : super(CreateCourseRoute.name, initialChildren: children);

  static const String name = 'CreateCourseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateCoursePage();
    },
  );
}

/// generated route for
/// [EnrolledCoursesPage]
class EnrolledCoursesRoute extends PageRouteInfo<void> {
  const EnrolledCoursesRoute({List<PageRouteInfo>? children})
    : super(EnrolledCoursesRoute.name, initialChildren: children);

  static const String name = 'EnrolledCoursesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EnrolledCoursesPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [QrGeneratorPage]
class QrGeneratorRoute extends PageRouteInfo<QrGeneratorRouteArgs> {
  QrGeneratorRoute({
    Key? key,
    required int sessionId,
    required DateTime sessionAt,
    required String courseName,
    List<PageRouteInfo>? children,
  }) : super(
         QrGeneratorRoute.name,
         args: QrGeneratorRouteArgs(
           key: key,
           sessionId: sessionId,
           sessionAt: sessionAt,
           courseName: courseName,
         ),
         initialChildren: children,
       );

  static const String name = 'QrGeneratorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QrGeneratorRouteArgs>();
      return QrGeneratorPage(
        key: args.key,
        sessionId: args.sessionId,
        sessionAt: args.sessionAt,
        courseName: args.courseName,
      );
    },
  );
}

class QrGeneratorRouteArgs {
  const QrGeneratorRouteArgs({
    this.key,
    required this.sessionId,
    required this.sessionAt,
    required this.courseName,
  });

  final Key? key;

  final int sessionId;

  final DateTime sessionAt;

  final String courseName;

  @override
  String toString() {
    return 'QrGeneratorRouteArgs{key: $key, sessionId: $sessionId, sessionAt: $sessionAt, courseName: $courseName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QrGeneratorRouteArgs) return false;
    return key == other.key &&
        sessionId == other.sessionId &&
        sessionAt == other.sessionAt &&
        courseName == other.courseName;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      sessionId.hashCode ^
      sessionAt.hashCode ^
      courseName.hashCode;
}

/// generated route for
/// [QrScanPage]
class QrScanRoute extends PageRouteInfo<void> {
  const QrScanRoute({List<PageRouteInfo>? children})
    : super(QrScanRoute.name, initialChildren: children);

  static const String name = 'QrScanRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QrScanPage();
    },
  );
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterPage();
    },
  );
}

/// generated route for
/// [TeacherHomePage]
class TeacherHomeRoute extends PageRouteInfo<void> {
  const TeacherHomeRoute({List<PageRouteInfo>? children})
    : super(TeacherHomeRoute.name, initialChildren: children);

  static const String name = 'TeacherHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TeacherHomePage();
    },
  );
}

/// generated route for
/// [TestingPage]
class TestingRoute extends PageRouteInfo<void> {
  const TestingRoute({List<PageRouteInfo>? children})
    : super(TestingRoute.name, initialChildren: children);

  static const String name = 'TestingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TestingPage();
    },
  );
}

/// generated route for
/// [UnderConstructionPage]
class UnderConstructionRoute extends PageRouteInfo<void> {
  const UnderConstructionRoute({List<PageRouteInfo>? children})
    : super(UnderConstructionRoute.name, initialChildren: children);

  static const String name = 'UnderConstructionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UnderConstructionPage();
    },
  );
}
