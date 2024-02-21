import 'package:flutter/material.dart';
import 'package:food_app_part1/widgets/big_text.dart';

class CartHistory extends StatefulWidget {
  const CartHistory({super.key});

  @override
  State<CartHistory> createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Container(
            child: 
            Row(
              children: [
                BigText(text: "Cart History", color: Colors.white, size: 20,)
              ],
            ),
          )

        ],
      ),
    );
  }
}