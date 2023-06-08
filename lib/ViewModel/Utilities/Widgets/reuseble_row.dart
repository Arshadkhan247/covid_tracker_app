import 'package:flutter/material.dart';

class ReusebleRow extends StatelessWidget {
  final String title, value;
  const ReusebleRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const Divider(color: Colors.transparent)
        ],
      ),
    );
    
  }
}
