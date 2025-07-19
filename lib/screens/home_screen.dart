import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../widgets/homescreen_action_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  child: ElasticIn(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.security_rounded,
                          size: 48,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'InsureSafe Protection',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeft(
                    child: const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      buildActionButton(
                        icon: Icons.add_circle_outline,
                        label: 'New Policy',
                        color: const Color(0xFF002C5F),
                      ),
                      buildActionButton(
                        icon: Icons.assignment_outlined,
                        label: 'File Claim',
                        color: const Color(0xFFE53935),
                      ),
                      buildActionButton(
                        icon: Icons.payment_outlined,
                        label: 'Make Payment',
                        color: const Color(0xFF43A047),
                      ),
                      buildActionButton(
                        icon: Icons.support_agent_outlined,
                        label: 'Contact Support',
                        color: const Color(0xFFFB8C00),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 100),
                    child: const Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SlideInUp(
                    child: const PlaceholderActivityItem(),
                  ),
                  const SizedBox(height: 8),
                  SlideInUp(
                    delay: const Duration(milliseconds: 50),
                    child: const PlaceholderActivityItem(),
                  ),
                  const SizedBox(height: 8),
                  SlideInUp(
                    delay: const Duration(milliseconds: 100),
                    child: const PlaceholderActivityItem(),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
