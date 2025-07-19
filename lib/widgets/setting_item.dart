import 'package:flutter/material.dart';

Widget buildSettingItem({
  required IconData icon,
  required String title,
}) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: ListTile(
      leading: Icon(icon, color: const Color(0xFF002C5F)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    ),
  );
}
