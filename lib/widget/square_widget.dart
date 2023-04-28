import 'package:flutter/material.dart';

Widget buildSquareContainer(String text, String imageUrl, bool displayInfo) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
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
          if (displayInfo)
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 15,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
