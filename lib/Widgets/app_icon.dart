import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  // Properties of the AppIcon widget
  final IconData icon;
  final Color? backgroundColor; // Make Color nullable
  final Color? iconColor; // Make Color nullable
  final double size;
  final double iconSize;

  // Constructor to initialize the properties
  const AppIcon({
    Key? key,
    required this.icon,
    this.backgroundColor, // Remove default value
    this.iconColor, // Remove default value
    this.size = 40, 
    this.iconSize= 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor ?? Color(0xFFfcf4e4), // Use null-aware operator
      ),
      
      child: Icon(
        icon,
        color: iconColor ?? Color(0xFF756d54),
        size: iconSize, // Use null-aware operator
      ),
    );
  }
}
