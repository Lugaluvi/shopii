import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/shopii_service.dart';
import 'package:shopping_list/views/edit_item.view.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.id,
    required this.title,
    required this.qtn,
  }) : super(key: key);

  final String id;
  final String title;
  final int qtn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Chip(
              padding: const EdgeInsets.all(8),
              backgroundColor: const Color(0xFF5600C3),
              label: Text(
                '$qtn',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(width: 130),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return const EditItem();
                  },
                );
              },
              icon: const Icon(Icons.edit_outlined),
              color: Colors.white,
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {
                ShopiiService.deleteItem(id: id);
              },
              icon: const Icon(Icons.clear_outlined),
              color: Colors.white,
              iconSize: 35,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.white12,
          height: 35,
          thickness: 1,
        ),
      ],
    );
  }
}
