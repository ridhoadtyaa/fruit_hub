import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/models/salad_model.dart';
import 'package:fruit_hub/widgets/button/button_primary.dart';

class DetailSaladScreen extends StatelessWidget {
  final Salad salad;

  const DetailSaladScreen({super.key, required this.salad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFA451),
      body: Column(
        children: [
          HeroSection(saladImage: salad.image),
          Expanded(
            child: WelcomeContent(
              salad: salad,
            ),
          ),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  final String saladImage;
  const HeroSection({super.key, required this.saladImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      color: const Color(0xFFFFA451),
      child: Image.asset(
        saladImage,
      ),
    );
  }
}

class WelcomeContent extends StatefulWidget {
  final Salad salad;
  const WelcomeContent({super.key, required this.salad});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeContentState createState() => _WelcomeContentState();
}

class _WelcomeContentState extends State<WelcomeContent> {
  int stock = 0;

  void increaseStock() {
    setState(() {
      stock++;
    });
  }

  void decreaseStock() {
    if (stock > 0) {
      setState(() {
        stock--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.salad.name,
                style: const TextStyle(
                  fontSize: 32,
                  color: Color(0xFF27214D),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      color: const Color(0xFF27214D),
                      onPressed: decreaseStock,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Text(
                    '$stock',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF27214D),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: const Color(0xFF27214D),
                      onPressed: increaseStock,
                    ),
                  ),
                ]),
                Row(children: [
                  SvgPicture.asset(
                    'assets/svg/currency.svg',
                    semanticsLabel: 'currency',
                    width: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.salad.price.toStringAsFixed(
                        widget.salad.price.truncateToDouble() ==
                                widget.salad.price
                            ? 0
                            : 1),
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xFF27214D),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ])
              ],
            ),
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'One Pack Contains:',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 183,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.orange,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF27214D),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you',
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: double.infinity,
                child: ButtonPrimary(
                  text: 'Add to basket',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to cart!'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
