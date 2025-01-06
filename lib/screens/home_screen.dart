import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/services/shared_preferences_service.dart';
import 'package:fruit_hub/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<String?> _loadName() async {
    String? name = await SharedPreferencesService.loadData('name');
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset(
                'assets/svg/menu.svg',
                semanticsLabel: 'toggle menu',
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: SvgPicture.asset('assets/svg/menu.svg'),
              onPressed: () {
                // Dummy button action
              },
            ),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          children: [
            FutureBuilder<String?>(
              future: _loadName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error loading name');
                } else {
                  final name = snapshot.data ?? 'Guest';
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: RichText(
                      text: TextSpan(
                        text: 'Hello $name, ',
                        style: const TextStyle(
                          color: Color(0xFF27214D),
                          fontSize: 20,
                          fontFamily: 'Brandon_Grotesque',
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'What fruit salad combo do you want today?',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Brandon_Grotesque',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
