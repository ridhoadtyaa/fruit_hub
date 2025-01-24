import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/models/salad_model.dart';

class SaladCard extends StatelessWidget {
  final Salad salad;

  final Color? bgColor;

  const SaladCard({super.key, required this.salad, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 23.0),
        decoration: BoxDecoration(
          color: salad.bgColor ?? Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF202020).withOpacity(0.05),
              offset: const Offset(0, 30),
              blurRadius: 60,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    salad.image,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 14.0),
                  Text(
                    salad.name,
                    style: const TextStyle(
                      color: Color(0xFF27214D),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/currency.svg',
                            semanticsLabel: 'currency',
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            salad.price.toStringAsFixed(0),
                            style: const TextStyle(
                              color: Color(0xFFF08626),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 36.0),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: SvgPicture.asset(
                          'assets/svg/add.svg',
                          semanticsLabel: 'add',
                        ),
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Added to cart!'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: SvgPicture.asset(
                      'assets/svg/heart.svg',
                      semanticsLabel: 'love',
                    ),
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () => {print('oke gas')}),
              ),
            ],
          ),
        ));
  }
}
