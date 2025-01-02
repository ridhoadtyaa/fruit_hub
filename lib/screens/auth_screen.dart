import 'package:flutter/material.dart';
import '../widgets/button/button_primary.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HeroSection(), // Gunakan widget HeroSection
          SizedBox(height: 56),
          WelcomeContent(), // Gunakan widget WelcomeContent
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      width: double.infinity,
      color: const Color(0xFFFFA451),
      child: Image.asset(
        'assets/image/fruit_basket2.png',
      ),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'What is your firstname?',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF27214D),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Robert',
              hintStyle: TextStyle(
                color: Color(0xFFC2BDBD),
                fontSize: 16,
              ),
              fillColor: Color(0xFFF3F1F1),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 42),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: double.infinity,
              child: ButtonPrimary(
                text: 'Start Ordering',
                onPressed: () {
                  print('OK');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
