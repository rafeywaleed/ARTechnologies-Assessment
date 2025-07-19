import 'package:flutter/material.dart';

Widget buildProfileItem({
  required IconData icon,
  required String title,
  required String value,
}) {
  return Row(
    children: [
      Icon(icon, size: 24, color: const Color(0xFF002C5F)),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
