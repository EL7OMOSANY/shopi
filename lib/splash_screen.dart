import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopi/core/animations/animate_do.dart';
import 'package:shopi/core/extensions/context_ext.dart';
import 'package:shopi/core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to home after 3 seconds
    Timer(const Duration(seconds: 3), () {
      context.pushReplacementNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [context.color.navBarbg!, context.color.textFormBorder!],
            center: Alignment.center, // تبقى من النص
            radius: 1.0, // كل ما تزود الرقم الدائرة تكبر
            tileMode: TileMode.mirror, // يخليها زي دوريات متكررة
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Logo Placeholder
            const CustomFadeInDown(
              duration: 1200,
              child: Icon(
                Icons.shopping_bag_rounded,
                color: Colors.white,
                size: 100,
              ),
            ),
            const SizedBox(height: 20),

            /// App Name
            const CustomFadeInUp(
              duration: 1400,
              child: Text(
                "Shopi",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 10),

            /// Subtitle
            const CustomFadeInUp(
              duration: 1600,
              child: Text(
                "Everything you need, in one place",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 40),

            /// Loading Indicator
            const CustomFadeInUp(
              duration: 1800,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: LinearProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.white24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
