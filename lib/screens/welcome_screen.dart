import 'package:flutter/material.dart';
import 'package:fruit_hub/screens/auth_screen.dart';
import 'package:fruit_hub/widgets/button/button_primary.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HeroSection(),
          SizedBox(height: 56),
          WelcomeContent(),
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
        'assets/image/fruit_basket1.png',
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
              'Get The Freshest Fruit Salad Combo',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF27214D),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF5D577E),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 58),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: double.infinity,
              child: ButtonPrimary(
                text: 'Let’s Continue',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AuthScreen();
                  }));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
