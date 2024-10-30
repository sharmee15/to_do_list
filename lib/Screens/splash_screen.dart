import 'package:flutter/material.dart';
import 'package:to_do_list/Screens/onboarding_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 165, 254),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/to-do-list-apps-removebg-preview.png', height: 100), 
            const SizedBox(height: 20),
            const Text(
              'Welcome...!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 2, 2, 2)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()), 
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 224, 165, 254), backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Get Started!'),
            ),
          ],
        ),
      ),
    );
  }
}