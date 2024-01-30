import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  // Properties of the AppIcon widget
  final IconData icon;
  final Color? backgroundColor; // Make Color nullable
  final Color? iconColor; // Make Color nullable
  final double size;

  // Constructor to initialize the properties
  const AppIcon({
    Key? key,
    required this.icon,
    this.backgroundColor, // Remove default value
    this.iconColor, // Remove default value
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Container widget to hold the icon with specified size and decoration
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor ?? Color(0xFFfcf4e4), // Use null-aware operator
      ),
      // Icon widget displayed inside the container
      child: Icon(
        icon,
        color: iconColor ?? Color(0xFF756d54), 
        size: Dimensions.iconSize16,// Use null-aware operator
      ),
    );
  }
}
