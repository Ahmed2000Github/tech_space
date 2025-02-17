import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tech_space/configurations/app-themes.dart';
import 'package:tech_space/routes/app_pages.dart';
import 'package:tech_space/routes/app_routes.dart';

void main() {
  runApp(  ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.LandingHome,
      theme: AppThemes.light, 
      getPages: AppPages.pages, 
    );
  }
}
