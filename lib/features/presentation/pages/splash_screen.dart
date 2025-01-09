import 'package:coffee_ui/features/presentation/pages/app_main_page.dart';
import 'package:flutter/material.dart';
import '../widgets/common_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            SizedBox(
              child: Image.asset(
                "assets/bg.png",
                height: height / 1.3,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 45,
                right: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Text(
                        "Fall in Love with Coffee in Blissful Delight!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            height: 1.3),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Welcome to our cozy coffee corner, where every cup is a delightful for you.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CommonButton(
                        title: 'Get Started',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AppMainPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
