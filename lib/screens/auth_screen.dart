import 'package:flutter/material.dart';
import 'package:fruit_hub/screens/home_screen.dart';
import 'package:fruit_hub/services/shared_preferences_service.dart';
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

class WelcomeContent extends StatefulWidget {
  const WelcomeContent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeContentState createState() => _WelcomeContentState();
}

class _WelcomeContentState extends State<WelcomeContent> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    String? name = await SharedPreferencesService.loadData('name');
    setState(() {
      _controller.text = name ?? '';
    });
  }

  Future<void> _saveName() async {
    await SharedPreferencesService.saveData('name', _controller.text);
  }

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
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
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
                  if (_controller.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Name cannot be empty.'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    _saveName();
                    _loadName();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
