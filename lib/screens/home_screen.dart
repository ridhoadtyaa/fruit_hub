import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/models/salad_model.dart';
import 'package:fruit_hub/services/shared_preferences_service.dart';
import 'package:fruit_hub/widgets/drawer.dart';
import 'package:fruit_hub/widgets/salad_card.dart';
import 'package:fruit_hub/widgets/selectable_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<String?> _loadName() async {
    String? name = await SharedPreferencesService.loadData('name');
    return name;
  }

  @override
  Widget build(BuildContext context) {
    final List<Salad> comboMenu = [
      Salad(
        name: 'Honey lime combo',
        price: 2000,
        image: 'assets/image/salad/combo1.png',
      ),
      Salad(
        name: 'Berry mango combo',
        price: 8000,
        image: 'assets/image/salad/combo2.png',
      ),
      Salad(
        name: 'Berry mango combo',
        price: 2000,
        image: 'assets/image/salad/combo1.png',
      ),
    ];

    final List<Salad> saladMenu = [
      Salad(
          name: 'Quinoa fruit salad',
          price: 2000,
          image: 'assets/image/salad/hot1.png',
          bgColor: const Color(0xFFFFFAEB)),
      Salad(
          name: 'Tropical fruit salad',
          price: 8000,
          image: 'assets/image/salad/hot2.png',
          bgColor: const Color(0xFFFEF0F0)),
      Salad(
          name: 'Melon fruit salad',
          price: 2000,
          image: 'assets/image/salad/hot3.png',
          bgColor: const Color(0xFFF1EFF6)),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
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
                  return Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
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
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
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
            ),
            const SizedBox(height: 40.0),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              child: Text(
                'Recommended Combo',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF27214D)),
              ),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: Colors.white, // Tetapkan warna latar belakang
                  child: Row(
                    children: comboMenu
                        .map((salad) => SaladCard(salad: salad))
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48.0),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              child: SelectableMenu(),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Scroll horizontal
                child: Row(
                  children: saladMenu
                      .map((salad) => SaladCard(salad: salad))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
