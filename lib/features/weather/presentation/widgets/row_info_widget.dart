import 'package:flutter/material.dart';

class RowInfoWidget extends StatelessWidget {
  const RowInfoWidget(
      {super.key,
      required this.iconData,
      required this.title,
      required this.value});
  final IconData iconData;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
