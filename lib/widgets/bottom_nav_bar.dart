import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF002C5F),
          unselectedItemColor: Colors.grey[500],
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          elevation: 0,
          items: [
            _buildNavItem(Icons.home_outlined, Icons.home_rounded, 'Home'),
            _buildNavItem(Icons.assignment_outlined, Icons.assignment_rounded,
                'Policies'),
            _buildNavItem(Icons.description_outlined, Icons.description_rounded,
                'Claims'),
            _buildNavItem(
                Icons.person_outlined, Icons.person_rounded, 'Profile'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData outline, IconData filled, String label) {
    return BottomNavigationBarItem(
      icon: Icon(outline, size: 24),
      activeIcon: Icon(filled, size: 24),
      label: label,
    );
  }
}
