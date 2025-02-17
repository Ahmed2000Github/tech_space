import 'package:get/get.dart';
import 'package:tech_space/features/Landing/views/landing/landing-home-page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.LandingHome,
      page: () => LandingHomePage(),
    ),
  ];
 
}
