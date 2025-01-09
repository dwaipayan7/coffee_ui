import 'package:coffee_ui/features/cors/colors.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CommonButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: xprimaryColor,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: SizedBox(
          height: 55,
          width: double.infinity,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
