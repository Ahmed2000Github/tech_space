import 'package:flutter/material.dart';
import 'package:tech_space/core/helpers/responsive-helper.dart';
import 'package:tech_space/features/Landing/views/landing/landing-home-page.desktop.dart';

class LandingHomePage extends StatefulWidget {
  const LandingHomePage({Key? key}) : super(key: key);

  @override
  _LandingHomePageState createState() => _LandingHomePageState();
}

class _LandingHomePageState extends State<LandingHomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper(
        mobile:
            Center(child: Text("Mobile View", style: TextStyle(fontSize: 18))),
        desktop: LandingHomePageDesktop(),
    
    );
  }
}
