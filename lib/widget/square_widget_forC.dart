import 'package:flutter/material.dart';

Widget buildSquareContainer(
    BuildContext context, String text, String imageUrl, bool displayInfo) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blueGrey,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 2,
          offset: const Offset(0, 0),
        ),
      ],
    ),
    width: MediaQuery.of(context).size.width, // Set width to screen width
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    ),
  );
}
