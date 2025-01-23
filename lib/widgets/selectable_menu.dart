import 'package:flutter/material.dart';

class OrangeUnderlineContainer extends StatelessWidget {
  const OrangeUnderlineContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.orange,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}

class SelectableMenu extends StatefulWidget {
  const SelectableMenu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectableMenuState createState() => _SelectableMenuState();
}

class _SelectableMenuState extends State<SelectableMenu> {
  String? selectedItem = 'Hottest';

  void _selectItem(String item) {
    setState(() {
      selectedItem = item;
    });
  }

  final List<String> menuItems = ['Hottest', 'Popular', 'New combo', 'Top'];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: menuItems.map((item) {
        return GestureDetector(
          onTap: () => _selectItem(item),
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item,
                  style: TextStyle(
                    fontSize: selectedItem == item ? 24 : 16,
                    fontWeight: FontWeight.w500,
                    color: selectedItem == item
                        ? const Color(0xFF27214D)
                        : const Color(0xFF938DB5),
                  ),
                ),
                if (selectedItem == item) const OrangeUnderlineContainer(),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
