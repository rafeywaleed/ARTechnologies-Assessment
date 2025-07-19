import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../widgets/profile_item.dart';
import '../widgets/setting_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: FadeIn(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF002C5F),
                      Color(0xFF0066CC),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/736x/56/bc/c4/56bcc419a760898b7f24b9f2d46b79bf.jpg')),
                      const SizedBox(height: 16),
                      ElasticIn(
                        child: const Text(
                          'Beluga',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      FadeIn(
                        child: const Text(
                          'Member since 2020',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              FadeInUp(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        buildProfileItem(
                          icon: Icons.email_outlined,
                          title: 'Email',
                          value: 'abc123@xyz.com',
                        ),
                        const Divider(),
                        buildProfileItem(
                          icon: Icons.phone_outlined,
                          title: 'Phone',
                          value: '+007 123 456 7890',
                        ),
                        const Divider(),
                        buildProfileItem(
                          icon: Icons.location_on_outlined,
                          title: 'Address',
                          value: '21B Baker Street, London',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FadeInUp(
                delay: const Duration(milliseconds: 100),
                child: const Text(
                  'Account Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SlideInUp(
                child: buildSettingItem(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                ),
              ),
              const SizedBox(height: 8),
              SlideInUp(
                delay: const Duration(milliseconds: 50),
                child: buildSettingItem(
                  icon: Icons.notifications_outlined,
                  title: 'Notification Settings',
                ),
              ),
              const SizedBox(height: 8),
              SlideInUp(
                delay: const Duration(milliseconds: 100),
                child: buildSettingItem(
                  icon: Icons.payment_outlined,
                  title: 'Payment Methods',
                ),
              ),
              const SizedBox(height: 8),
              SlideInUp(
                delay: const Duration(milliseconds: 150),
                child: buildSettingItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                ),
              ),
              const SizedBox(height: 32),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, size: 18),
                      SizedBox(width: 8),
                      Text('Sign Out'),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
