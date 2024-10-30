import 'package:flutter/material.dart';
import 'package:to_do_list/Screens/todolist_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ToDoListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 224, 165, 254),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: const [
                OnboardingSlide(
                  image: 'lib/assets/to-do-list-checklist.gif',
                  title: 'Welcome to ToDo App',
                  description:
                      'Manage your tasks efficiently with our easy-to-use ToDo list.',
                ),
                OnboardingSlide(
                  image: 'lib/assets/notebook-label-to-do-list-icon-clipart-in-cartoon-animated-vector-removebg-preview.png',
                  title: 'Organize Your Life',
                  description: 'Add, edit, and delete tasks to stay organized.',
                ),
                OnboardingSlide(
                  image: 'lib/assets/loginscreen-removebg-preview.png',
                  title: 'Settings',
                  description:
                      'In settings you can login to save your takes.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _onNextPage,
              child: Text(_currentPage == 2 ? 'Get Started' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingSlide({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
