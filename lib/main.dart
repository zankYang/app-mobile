import 'package:flutter/material.dart';
import 'package:proyecto_final/routes/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

 @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
