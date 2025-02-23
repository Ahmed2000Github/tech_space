import 'package:get/get.dart';
import 'package:tech_space/features/Landing/views/landing_home/landing-home-page.dart';
import 'package:tech_space/features/Landing/views/widgets/authentication.mobile.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.LandingHome,
      page: () => LandingHomePage(),
    ),
    GetPage(
      name: AppRoutes.AuthMobile,
      page: () => AuthenticationMobile(),
        transition: Transition.leftToRight
    ),
  ];
 
}
