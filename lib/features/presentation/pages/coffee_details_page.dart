import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CoffeeDetailsPage extends StatelessWidget {
  const CoffeeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Adjust based on your theme.
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const SizedBox(height: 40),

          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 24,
                ),
              ),

              // Title
              const Expanded(
                child: Text(
                  "Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Heart Icon
              IconButton(
                onPressed: () {
                  // Add favorite logic here.
                },
                icon: const Icon(
                  Iconsax.heart,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
