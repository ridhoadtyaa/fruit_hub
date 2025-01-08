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
        toolbarHeight: 65,
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
              icon: SvgPicture.asset(
                'assets/svg/cart.svg',
                semanticsLabel: 'cart',
              ),
              onPressed: () {
                // Dummy button action
              },
            ),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: SizedBox(
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
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for fruit salad combos',
                      hintStyle: TextStyle(
                        color: Color(0xFF86869E),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      fillColor: Color(0xFFF3F4F9),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFC2BDBD),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/svg/filter.svg',
                    semanticsLabel: 'filter',
                  ),
                  onPressed: () {
                    // Dummy button action
                  },
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Recommended Combo',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF27214D)),
            )
          ],
        ),
      ),
    );
  }
}
